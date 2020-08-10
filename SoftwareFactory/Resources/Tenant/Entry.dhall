let Tenant = ./schema.dhall

let Entry =
      λ(tenant : ./Type.dhall) → { mapKey = tenant.name, mapValue = tenant }

let example0 =
      let tenant =
            Tenant::{
            , name = "a-tenant"
            , description = Some "A description"
            , url = "https://domain.com"
            , tenant-options = Some [ { mapKey = "test", mapValue = "value" } ]
            }

      in  assert : Entry tenant ≡ { mapKey = "a-tenant", mapValue = tenant }

in  Entry
