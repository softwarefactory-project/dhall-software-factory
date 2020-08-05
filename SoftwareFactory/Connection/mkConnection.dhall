let mkConnection =
      λ(connection : ./Type.dhall) →
        [ { mapKey = connection.name, mapValue = connection } ]

in  mkConnection
