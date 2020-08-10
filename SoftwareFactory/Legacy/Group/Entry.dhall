let Group = ./schema.dhall

let Entry = λ(group : ./Type.dhall) → { mapKey = group.name, mapValue = group }

let example0 =
      let group =
            Group::{ name = "a-group", members = Some [ "John", "Janem" ] }

      in  assert : Entry group ≡ { mapKey = "a-group", mapValue = group }

in  Entry
