let Prelude = ../../Prelude.dhall

let TenantOptionsValue = ../TenantOptionsValue/Type.dhall

let tenantType =
      { name : Text
      , url : Text
      , description : Optional Text
      , tenant-options : Optional (Prelude.Map.Type Text TenantOptionsValue )
      , default-connection : Optional Text
      , allowed-reporters : Optional (List Text)
      , allowed-triggers : Optional (List Text)
      }

in  tenantType
