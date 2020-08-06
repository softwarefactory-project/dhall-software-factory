-- Note: This code may be moved to shake-factory for simple re-use.

import Development.Shake
import Development.Shake.Command
import Development.Shake.FilePath
import Development.Shake.Util

-- | Render the documentation of a dhall project
docsDhall ::
  -- | The name of the dhall package
  String ->
  Action ()
docsDhall name = do
  cmd_ "mkdir -p build"
  cmd_ "dhall-docs --input . --package-name" name "--output-link build/result --ascii"
  cmd_ "rsync --delete -r build/result/ build/docs/"
  cmd_ "find build/docs/ -type d -exec chmod 0755 {} +"
  cmd_ "find build/docs/ -type f -exec chmod 0644 {} +"

-- | Create a dhall package from a list of files:
--
--   >>> mkDhallPackage ["Type.dhall", "Project/package.dhall"]
--   '{ Type = ./Type.dhall, Project = ./Project/package.dhall }'
mkDhallPackage :: [FilePath] -> String
mkDhallPackage = mkRecord . map mkAttribute
  where
    mkRecord :: [String] -> String
    mkRecord attrs = "{\n" <> unlines attrs <> "}"
    mkAttribute :: FilePath -> String
    mkAttribute f = "," <> getName f <> " = ./" <> f
    getName :: FilePath -> String
    getName fp =
      let fc = getFirstComponent fp
       in if hasExtension fc
            then dropExtensions fc
            else takeDirectory fc
    getFirstComponent :: FilePath -> FilePath
    getFirstComponent = head . splitPath

-- | Create a dhall package at file at location from ["*.dhall", */package.dhall]
--   For example, if the location directory contains a Type and default file, the package will contains:
--   { Type = ./Type.dhall, default = ./default.dhall }
dhallPackageAction :: FilePath -> Action ()
dhallPackageAction target =
  do
    -- Get the directory files excluding "package.dhall" and "Prelude.dhall"
    files <- filter (flip notElem ["package.dhall", "Prelude.dhall"]) <$> getDirectoryFiles targetDir ["*.dhall", "*/package.dhall"]
    putVerbose $ "Creating package with: " <> show files
    -- Generate the package.dhall
    let packageText = mkDhallPackage files
    putVerbose $ target <> ": need " <> show files <> " (from " <> targetDir <> ") -> \n" <> packageText
    -- Indicate that this package needs all of it's file import
    need (map (targetDir </>) files)
    -- Format and freeze the package
    formatted <- dhallFormat packageText
    frozen <- dhallFreeze targetDir formatted
    -- Write the package content
    writeFile' target frozen
  where
    targetDir = takeDirectory target
    dropLength = length (splitPath targetDir) - 1

-- | A shake action to run dhall
dhallCommand ::
  -- | The cwd
  FilePath ->
  -- | The dhall args
  [String] ->
  -- | The command input
  String ->
  Action String
dhallCommand cwd args input = do
  Stdout out <- command [Cwd cwd, Stdin input] "dhall" args
  pure out

-- | A shake action to run dhall format
dhallFormat ::
  -- | The dhall expression
  String ->
  Action String
dhallFormat = dhallCommand "." ["format", "--ascii"]

-- | A shake action to run dhall freeze
dhallFreeze ::
  -- | The cwd
  String ->
  -- | The dhall expression
  String ->
  Action String
dhallFreeze cwd = dhallCommand cwd ["freeze", "--all"]

dhallWrite ::
  -- | The cwd
  String ->
  -- | The dhall expression
  String ->
  -- | The output file
  String ->
  Action ()
dhallWrite cwd expr target = dhallFreeze cwd expr >>= writeFile' target

main :: IO ()
main = shakeArgs shakeOptions {shakeFiles = "_build"} $ do
  -- By default we want the src/package.dhall and run the test rule
  want [mainGoal, "test"]
  -- A custom rule for the top-level package.dhall
  "package.dhall" %> \_ -> do
    need ["SoftwareFactory/package.dhall"]
    dhallWrite "." "./SoftwareFactory/package.dhall" "package.dhall"
  -- Define the dhall package rules
  "//package.dhall" %> \package -> dhallPackageAction package
  -- Add docs rule
  phony "docs" $ docsDhall "dhall-software-factory"
  -- Add test rule
  phony "test" $ do
    need [mainGoal]
    cmd_ "dhall-to-yaml --file examples/demo.dhall"
  where
    mainGoal = "package.dhall"
