let Prelude = ../Prelude.dhall

in  { tenants = None (Prelude.Map.Type Text ./Tenant/Type.dhall)
    , connections = None (Prelude.Map.Type Text ./Connection/Type.dhall)
    , repos = None (Prelude.Map.Type Text ./GitRepository/Type.dhall)
    , acls = None (Prelude.Map.Type Text ./GitACL/Type.dhall)
    , groups = None (Prelude.Map.Type Text ./Group/Type.dhall)
    , projects = None (Prelude.Map.Type Text ./Project/Type.dhall)
    }
