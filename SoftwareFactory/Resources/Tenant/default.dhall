let Prelude = ../../Prelude.dhall

let TenantOptionsValue = ../TenantOptions/Type.dhall

let tenantDefault =
      { description = None Text
      , tenant-options = None (Prelude.Map.Type Text TenantOptionsValue)
      , default-connection = None Text
      , allowed-reporters = None (List Text)
      , allowed-triggers = None (List Text)
      }

in  tenantDefault
