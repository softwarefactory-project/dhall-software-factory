let GitRepository = ./schema.dhall

let Entry = λ(repo : ./Type.dhall) → { mapKey = repo.name, mapValue = repo }

let example0 =
      let repo =
            GitRepository::{
            , name = "a-repo"
            , description = Some "A git repository"
            , branches = Some [ "master", "stable/1.0" ]
            }

      in  assert : Entry repo ≡ { mapKey = "a-repo", mapValue = repo }

in  Entry
