let GitRepository = ./schema.dhall

let mkGitRepository =
      λ(repo : ./Type.dhall) → [ { mapKey = repo.name, mapValue = repo } ]

let example0 =
      mkGitRepository
        GitRepository::{
        , name = "a-repo"
        , description = Some "A git repository"
        , branches = Some [ "master", "stable/1.0" ]
        }

in  mkGitRepository
