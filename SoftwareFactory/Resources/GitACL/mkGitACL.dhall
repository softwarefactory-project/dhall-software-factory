let mkGitACL = λ(acl : ./Type.dhall) → [ { mapKey = acl.name, mapValue = acl } ]

in  mkGitACL
