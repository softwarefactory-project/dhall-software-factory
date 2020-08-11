let SoftwareFactory =
      { Resources.Type = ./Type.dhall
      , Project = ../Project/package.dhall
      , Tenant = ../Tenant/package.dhall
      , GitRepository = ../GitRepository/package.dhall
      , Group = ../Group/package.dhall
      , GitACL = ../GitACL/package.dhall
      , Connection = ../Connection/package.dhall
      }

let Prelude = ../Prelude.dhall

let mkMap
    : forall (a : Type) ->
      forall (name : a -> Text) ->
      forall (l : List a) ->
        Prelude.Map.Type Text a
    = \(a : Type) ->
      \(name : a -> Text) ->
        Prelude.List.map
          a
          (Prelude.Map.Entry Text a)
          (\(obj : a) -> { mapKey = name obj, mapValue = obj })

let render =
      \(resources : SoftwareFactory.Resources.Type) ->
        { resources =
          { projects =
              mkMap
                SoftwareFactory.Project.Type
                SoftwareFactory.Project.Name
                resources.projects
          , tenants =
              mkMap
                SoftwareFactory.Tenant.Type
                SoftwareFactory.Tenant.Name
                resources.tenants
          , repos =
              mkMap
                SoftwareFactory.GitRepository.Type
                SoftwareFactory.GitRepository.Name
                resources.repos
          , groups =
              mkMap
                SoftwareFactory.Group.Type
                SoftwareFactory.Group.Name
                resources.groups
          , acls =
              mkMap
                SoftwareFactory.GitACL.Type
                SoftwareFactory.GitACL.Name
                resources.acls
          , connections =
              mkMap
                SoftwareFactory.Connection.Type
                SoftwareFactory.Connection.Name
                resources.connections
          }
        }

in  render
