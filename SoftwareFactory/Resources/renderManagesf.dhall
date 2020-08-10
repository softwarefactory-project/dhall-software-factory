let SoftwareFactory =
      { Resources.Type = ./Type.dhall
      , Project = ../Project/package.dhall
      , Tenant = ../Tenant/package.dhall
      }

let Prelude = ../Prelude.dhall

let packer
    : forall (a : Type) ->
      forall (f : a -> Prelude.Map.Entry Text a) ->
      forall (l : List a) ->
        Prelude.Map.Type Text a
    = \(a : Type) ->
      \(f : a -> Prelude.Map.Entry Text a) ->
      \(l : List a) ->
        Prelude.List.map a (Prelude.Map.Entry Text a) f l

let render =
      \(resources : SoftwareFactory.Resources.Type) ->
        { resources =
          { projects =
              packer
                SoftwareFactory.Project.Type
                ( \(project : SoftwareFactory.Project.Type) ->
                    { mapKey = project.name, mapValue = project }
                )
                resources.projects
          , tenants =
              packer
                SoftwareFactory.Tenant.Type
                ( \(obj : SoftwareFactory.Tenant.Type) ->
                    { mapKey = obj.name, mapValue = obj }
                )
                resources.tenants
          }
        }

in  render
