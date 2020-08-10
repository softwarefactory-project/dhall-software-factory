let Prelude = ../../Prelude.dhall

let List/map = Prelude.List.map

let Group = ./schema.dhall

let pack = ../packer.dhall Group.Type ./Entry.dhall

let example0 =
      let group =
            Group::{ name = "a-group", members = Some [ "John", "Janem" ] }

      in  assert : pack [ group ] ≡ toMap { a-group = group }

in  pack
