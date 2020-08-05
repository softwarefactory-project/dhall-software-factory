let mkTenant =
      λ(tenant : ./Type.dhall) → [ { mapKey = tenant.name, mapValue = tenant } ]

in  mkTenant
