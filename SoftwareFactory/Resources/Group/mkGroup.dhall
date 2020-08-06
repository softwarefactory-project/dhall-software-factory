let mkGroup =
      λ(group : ./Type.dhall) → [ { mapKey = group.name, mapValue = group } ]

in  mkGroup
