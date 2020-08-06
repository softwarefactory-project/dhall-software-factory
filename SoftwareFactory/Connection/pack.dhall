let Prelude = ../../Prelude.dhall

let List/map = Prelude.List.map

let Connection = ./schema.dhall

let pack = ../packer.dhall Connection.Type ./Entry.dhall

let example0 =
      let cnx1 =
            Connection::{
            , name = "a-connection2"
            , base-url = Some "https://review.opendev.org"
            , type = (../ConnectionType/package.dhall).gerrit
            }

      in  assert : pack [ cnx1 ] ≡ toMap { a-connection2 = cnx1 }

in  pack
