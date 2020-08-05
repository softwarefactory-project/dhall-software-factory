let Connection = ./schema.dhall

let example0 =
      Connection::{
      , name = "a-connection"
      , base-url = Some "https://review.opendev.org"
      , type = "gerrit"
      }

in  ./mkConnection.dhall example0
