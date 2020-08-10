let Project = ./schema.dhall

let Entry =
      λ(project : ./Type.dhall) → { mapKey = project.name, mapValue = project }

let example0 =
      let project = ./example.dhall

      in  assert : Entry project ≡ { mapKey = "a-project", mapValue = project }

in  Entry
