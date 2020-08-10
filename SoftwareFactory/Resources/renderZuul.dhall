let SoftwareFactory =
      { Resources.Type = ./Type.dhall, Tenant = ../Tenant/package.dhall }

let Prelude = ../Prelude.dhall

let Zuul = { Tenant.Type = { name : Text, report-build-page : Optional Bool } }

let renderTenant =
      \(tenant : SoftwareFactory.Tenant.Type) ->
        let options = SoftwareFactory.Tenant.getOptions tenant

        in  { tenant =
              { name = tenant.name
              , report-build-page = options.zuul/report-build-page
              }
            }

let render =
      \(resources : SoftwareFactory.Resources.Type) ->
        Prelude.List.map
          SoftwareFactory.Tenant.Type
          { tenant : Zuul.Tenant.Type }
          renderTenant
          resources.tenants

in  render
