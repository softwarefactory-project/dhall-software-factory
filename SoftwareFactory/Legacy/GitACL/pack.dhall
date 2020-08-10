let Prelude = ../../Prelude.dhall

let List/map = Prelude.List.map

let GitACL = ./schema.dhall

let pack = ../packer.dhall GitACL.Type ./Entry.dhall

let example0 =
      let acl1 =
            GitACL::{
            , name = "acl-1"
            , file = "ACL data"
            , groups = Some [ "Jane", "John" ]
            }

      in  assert : pack [ acl1 ] ≡ toMap { acl-1 = acl1 }

in  pack
