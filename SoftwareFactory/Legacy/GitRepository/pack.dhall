let Prelude = ../../Prelude.dhall

let GitRepository = ./schema.dhall

let pack = ../packer.dhall GitRepository.Type ./Entry.dhall

let example0 =
      let repo1 =
            GitRepository::{
            , name = "a-repo"
            , description = Some "A git repository"
            , branches = Some [ "master", "stable/1.0" ]
            }

      in  assert : pack [ repo1 ] ≡ toMap { a-repo = repo1 }

in  pack
