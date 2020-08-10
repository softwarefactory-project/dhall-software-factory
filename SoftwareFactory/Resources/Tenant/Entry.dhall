let Tenant = ./schema.dhall

let TenantOptions = ../TenantOptions/schema.dhall

let render = ../TenantOptions/render.dhall

let Entry =
      λ(tenant : ./Type.dhall) → { mapKey = tenant.name, mapValue = tenant }

let example0 =
      let tenant =
            Tenant::{
            , name = "a-tenant"
            , description = Some "A description"
            , url = "https://domain.com"
            , tenant-options = Some
              [ render (TenantOptions.Type.zuul/config-repo True) ]
            }

      in  assert : Entry tenant ≡ { mapKey = "a-tenant", mapValue = tenant }

in  Entry
