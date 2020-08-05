let Prelude = https://prelude.dhall-lang.org/v15.0.0/package.dhall

let resourcesType =
      { tenants = None (List (Prelude.Map.Type Text ../Tenant/Type.dhall))
      , connections =
          None (List (Prelude.Map.Type Text ../Connection/Type.dhall))
      , repos = None (List (Prelude.Map.Type Text ../GitRepository/Type.dhall))
      , acls = None (List (Prelude.Map.Type Text ../GitACL/Type.dhall))
      , groups = None (List (Prelude.Map.Type Text ../Group/Type.dhall))
      , projects = None (List (Prelude.Map.Type Text ../Project/Type.dhall))
      }

in  resourcesType
