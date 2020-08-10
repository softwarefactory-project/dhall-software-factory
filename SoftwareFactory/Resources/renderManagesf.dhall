let SoftwareFactory =
      { Resources.Type = ./Type.dhall
      , Project = ../Project/package.dhall
      , Tenant = ../Tenant/package.dhall
      , GitRepository = ../GitRepository/package.dhall
      , Group = ../Group/package.dhall
      , GitACL = ../GitACL/package.dhall
      }

let Prelude = ../Prelude.dhall

let packer
    : ∀(a : Type) →
      ∀(f : a → Prelude.Map.Entry Text a) →
      ∀(l : List a) →
        Prelude.Map.Type Text a
    = λ(a : Type) →
      λ(f : a → Prelude.Map.Entry Text a) →
      λ(l : List a) →
        Prelude.List.map a (Prelude.Map.Entry Text a) f l

let render =
      λ(resources : SoftwareFactory.Resources.Type) →
        { resources =
          { projects =
              packer
                SoftwareFactory.Project.Type
                ( λ(project : SoftwareFactory.Project.Type) →
                    { mapKey = project.name, mapValue = project }
                )
                resources.projects
          , tenants =
              packer
                SoftwareFactory.Tenant.Type
                ( λ(obj : SoftwareFactory.Tenant.Type) →
                    { mapKey = obj.name, mapValue = obj }
                )
                resources.tenants
          , repos =
              packer
                SoftwareFactory.GitRepository.Type
                ( λ(obj : SoftwareFactory.GitRepository.Type) →
                    { mapKey = obj.name, mapValue = obj }
                )
                resources.repos
          , groups =
              packer
                SoftwareFactory.Group.Type
                ( λ(obj : SoftwareFactory.Group.Type) →
                    { mapKey = obj.name, mapValue = obj }
                )
                resources.groups
          , acls =
              packer
                SoftwareFactory.GitACL.Type
                ( λ(obj : SoftwareFactory.GitACL.Type) →
                    { mapKey = obj.name, mapValue = obj }
                )
                resources.acls
          }
        }

in  render
