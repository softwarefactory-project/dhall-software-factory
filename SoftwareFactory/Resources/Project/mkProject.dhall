let mkProject =
      λ(project : ./Type.dhall) →
        [ { mapKey = project.name, mapValue = project } ]

in  mkProject
