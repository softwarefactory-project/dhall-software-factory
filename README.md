# dhall-software-factory

`dhall-software-factory` contains [Dhall][dhall-lang] bindings to [Software Factory][sf],
so you can generate software factory configuration from Dhall expressions.

## Demo resources

```
-- ./examples/resources.dhall
let SoftwareFactory = ../package.dhall

let project = SoftwareFactory.Project::{ name = "tdpw" }

let tenant =
      SoftwareFactory.Tenant::{
      , name = "fedora"
      , url = "https://fedora.sf.io"
      , tenant-options = Some SoftwareFactory.TenantOptions::{
        , zuul/web-url = Some "https://fedora.sf.io/zuul"
        }
      }

in  SoftwareFactory.Resources::{ projects = [ project ], tenants = [ tenant ] }

```

Result in resources engine compatible schema:

```
# dhall-to-yaml <<< '(./package.dhall).Resources.renderManagesf ./examples/resources.dhall'
resources:
  projects:
    tdpw:
      name: tdpw
  tenants:
    fedora:
      name: fedora
      tenant-options:
        zuul/web-url: https://fedora.sf.io/zuul
      url: https://fedora.sf.io

```

And in zuul configuration:
```
# dhall-to-yaml <<< '(./package.dhall).Resources.renderZuul ./examples/resources.dhall'

- tenant:
    name: fedora

```



```
-- ./examples/legacy.dhall
let SoftwareFactory = ../package.dhall

let SFResources = SoftwareFactory.Legacy

let mkSourceRepository = SFResources.Project.mkSourceRepository

let SourceRepository = SFResources.SourceRepository

let SourceRepositoryOptions = SFResources.SourceRepositoryOptions

let TenantOptions = SFResources.TenantOptions

let source-repos =
      [ SourceRepository.Type.Name "repo1"
      , mkSourceRepository
          [ { mapKey = "zuul/config-project"
            , mapValue =
                SourceRepositoryOptions.Type.SourceRepositoryOptionsValueType.BoolValue
                  True
            }
          ]
          "repo2"
      ]

let repos =
      SFResources.GitRepository.pack
        [ SFResources.GitRepository::{ name = "repo1", acl = Some "acl1" }
        , SFResources.GitRepository::{ name = "repo2", acl = Some "acl1" }
        ]

let groups =
      SFResources.Group.pack
        [ SFResources.Group::{
          , name = "group1"
          , description = Some "The group 1"
          }
        ]

let tenants =
      SFResources.Tenant.pack
        [ SFResources.Tenant::{
          , name = "local"
          , url = "https://softwarefactory-project.io/manage"
          , description = Some "The local tenant"
          , tenant-options = Some
              ( SFResources.TenantOptions.pack
                  [ TenantOptions.Type.zuul/report-build-page True
                  , TenantOptions.Type.zuul/web-root "https://test.com"
                  ]
              )
          }
        ]

let projects =
      SFResources.Project.pack
        [ SFResources.Project::{
          , name = "demo-project"
          , connection = "gerrit"
          , source-repositories = Some source-repos
          }
        ]

let acls =
      SFResources.GitACL.pack
        [ SFResources.GitACL::{
          , name = "acl1"
          , file =
              ''
              this is a
              acl''
          }
        ]

let gerrit = SFResources.ConnectionType.gerrit

let connections =
      SFResources.Connection.pack
        [ SFResources.Connection::{ name = "A connection 1", type = gerrit }
        , SFResources.Connection::{ name = "A connection 2", type = gerrit }
        ]

let resources =
      SFResources::{
      , repos = Some repos
      , groups = Some groups
      , acls = Some acls
      , projects = Some projects
      , tenants = Some tenants
      , connections = Some connections
      }

in  { resources }

```

```yaml
# dhall-to-yaml --file ./examples/legacy.dhall
resources:
  acls:
    acl1:
      file: "this is a\nacl"
      name: acl1
  connections:
    A connection 1:
      name: A connection 1
      type: gerrit
    A connection 2:
      name: A connection 2
      type: gerrit
  groups:
    group1:
      description: The group 1
      name: group1
  projects:
    demo-project:
      connection: gerrit
      name: demo-project
      source-repositories:
        - repo1
        - repo2:
            zuul/config-project: true
  repos:
    repo1:
      acl: acl1
      name: repo1
    repo2:
      acl: acl1
      name: repo2
  tenants:
    local:
      description: The local tenant
      name: local
      tenant-options:
        zuul/report-build-page: true
        zuul/web-root: https://test.com
      url: https://softwarefactory-project.io/manage

```

[dhall-lang]: https://dhall-lang.org
[sf]: https://www.softwarefactory-project.io
