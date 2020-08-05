let Prelude = https://prelude.dhall-lang.org/v15.0.0/package.dhall

let tenantDefault =
      { name = Text
      , url = Text
      , description = None Text
      , tenant-options = None (Prelude.Map.Type Text Text)
      , default-connection = None Text
      , allowed-reporters = None (List Text)
      , allowed-triggers = None (List Text)
      }

in  tenantDefault
