let Connection = ./schema.dhall

let cnx1 =
      Connection::{
      , name = "a-connection1"
      , base-url = Some "https://review.opendev.org"
      , type = "gerrit"
      }

let cnx2 =
      Connection::{
      , name = "a-connection2"
      , base-url = Some "https://review.opendev.org"
      , type = "gerrit"
      }

let example0 = ./mkConnection.dhall cnx1

let example1 = ./pack.dhall [ cnx1, cnx2 ]

in  { example0, example1 }
