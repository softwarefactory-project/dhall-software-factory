let Tenant = ./schema.dhall

let example0 =
      Tenant::{
      , name = "a-tenant"
      , description = Some "A description"
      , url = "https://domain.com"
      , tenant-options = Some [ { mapKey = "test", mapValue = "value" } ]
      }

in  ./mkTenant.dhall example0
