let GitACL = ./schema.dhall

let Entry = λ(acl : ./Type.dhall) → { mapKey = acl.name, mapValue = acl }

let example0 =
      let acl =
            GitACL::{
            , name = "acl-1"
            , file = "ACL data"
            , groups = Some [ "Jane", "John" ]
            }

      in  assert : Entry acl ≡ { mapKey = "acl-1", mapValue = acl }

in  Entry
