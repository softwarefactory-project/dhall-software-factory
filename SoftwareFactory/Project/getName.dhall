{-|
Return the name of a project
-}
let Project = ./schema.dhall

let getName
    : Project.Type -> Text
    = \(project : Project.Type) -> project.name

let example0 = assert : getName Project::{ name = "sf" } === "sf"

in  getName
