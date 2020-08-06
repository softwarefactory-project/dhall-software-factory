let ConnectionType = ../ConnectionType/package.dhall

let Connection = ./schema.dhall

let Entry =
      λ(connection : ./Type.dhall) →
        { mapKey = connection.name, mapValue = connection }

let example0 =
      let cnx =
            Connection::{
            , name = "a-connection1"
            , base-url = Some "https://review.opendev.org"
            , type = ConnectionType.gerrit
            }

      in  assert : Entry cnx ≡ { mapKey = "a-connection1", mapValue = cnx }

in  Entry
