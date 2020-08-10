\(tenant : ./Type.dhall) ->
  merge
    { None = ../TenantOptions/default.dhall
    , Some = \(some : ../TenantOptions/Type.dhall) -> some
    }
    tenant.tenant-options
