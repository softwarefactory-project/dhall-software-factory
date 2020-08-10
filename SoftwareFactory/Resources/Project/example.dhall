let Project = ./schema.dhall

let mkSourceRepository = ./mkSourceRepository.dhall

let a-src-repo-with-options =
      mkSourceRepository
        [ { mapKey = "a-src-repo-with-options"
          , mapValue =
              ( ../SourceRepositoryOptions/Type.dhall
              ).SourceRepositoryOptionsValueType.BoolValue
                True
          }
        ]
        "a-src-repo-with-options"

let a-src-repo = (../SourceRepository/Type.dhall).Name "a-src-repo"

let example =
      Project::{
      , name = "a-project"
      , description = Some "Description"
      , connection = "connection.com"
      , source-repositories = Some [ a-src-repo-with-options, a-src-repo ]
      }

in example
