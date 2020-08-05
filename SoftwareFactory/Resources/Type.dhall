let Prelude = https://prelude.dhall-lang.org/v15.0.0/package.dhall

let resourcesType =
      { tenants : Optional (List (Prelude.Map.Type Text ../Tenant/Type.dhall))
      , connections :
          Optional (List (Prelude.Map.Type Text ../Connection/Type.dhall))
      , repos :
          Optional (List (Prelude.Map.Type Text ../GitRepository/Type.dhall))
      , acls : Optional (List (Prelude.Map.Type Text ../GitACL/Type.dhall))
      , groups : Optional (List (Prelude.Map.Type Text ../Group/Type.dhall))
      , projects : Optional (List (Prelude.Map.Type Text ../Project/Type.dhall))
      }

in  resourcesType
