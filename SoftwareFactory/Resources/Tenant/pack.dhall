let Prelude = ../../Prelude.dhall

let Tenant = ./schema.dhall

let pack = ../packer.dhall Tenant.Type ./Entry.dhall

let example0 =
      let tenant =
            Tenant::{
            , name = "a-tenant"
            , description = Some "A description"
            , url = "https://domain.com"
            , tenant-options = Some [ { mapKey = "test", mapValue = "value" } ]
            }

      in  assert : pack [ tenant ] ≡ toMap { a-tenant = tenant }

in  pack
