let Prelude = ../../Prelude.dhall

let Project = ./schema.dhall

let pack = ../packer.dhall Project.Type ./Entry.dhall

let example0 =
      let project = ./example.dhall

      in  assert : pack [ project ] ≡ toMap { a-project = project }

in  pack
