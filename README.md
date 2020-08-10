# dhall-software-factory

`dhall-software-factory` contains [Dhall][dhall-lang] bindings to [Software Factory][sf],
so you can generate software factory configuration from Dhall expressions.

## Demo resources

```
-- ./examples/resources.dhall
let SoftwareFactory = ../package.dhall

let repo1 = SoftwareFactory.SourceRepository.Name "repo1"

let repo2 =
      SoftwareFactory.SourceRepository.WithOptions
        SoftwareFactory.SourceRepository::{ zuul/include = Some [ "job" ] }
        "repo2"

let project =
      SoftwareFactory.Project::{
      , name = "tdpw"
      , connection = "github.com"
      , source-repositories = Some [ repo1, repo2 ]
      }

let repo =
      SoftwareFactory.GitRepository::{
      , name = "a-repo"
      , description = Some "A git repository"
      , branches = Some [ "master", "stable/1.0" ]
      }

let cnx =
      SoftwareFactory.Connection::{
      , name = "a-connection1"
      , base-url = Some "https://review.opendev.org"
      , type = SoftwareFactory.ConnectionType.gerrit
      }

let group =
      SoftwareFactory.Group::{
      , name = "a-group"
      , members = Some [ "John", "Jane" ]
      }

let acl =
      SoftwareFactory.GitACL::{
      , name = "acl-1"
      , file = "ACL data"
      , groups = Some [ "core", "ui" ]
      }

let tenant =
      SoftwareFactory.Tenant::{
      , name = "fedora"
      , url = "https://fedora.sf.io"
      , tenant-options = Some SoftwareFactory.TenantOptions::{
        , zuul/web-url = Some "https://fedora.sf.io/zuul"
        }
      }

in  SoftwareFactory.Resources::{
    , projects = [ project ]
    , tenants = [ tenant ]
    , groups = [ group ]
    , acls = [ acl ]
    , connections = [ cnx ]
    , repos = [ repo ]
    }

```

Result in resources engine compatible schema:

```
# dhall-to-yaml <<< '(./package.dhall).Resources.renderManagesf ./examples/resources.dhall'
resources:
  acls:
    acl-1:
      file: ACL data
      groups:
        - core
        - ui
      name: acl-1
  groups:
    a-group:
      members:
        - John
        - Jane
      name: a-group
  projects:
    tdpw:
      connection: github.com
      name: tdpw
      source-repositories:
        - repo1
        - repo2:
            zuul/include:
              - job
  repos:
    a-repo:
      branches:
        - master
        - stable/1.0
      description: A git repository
      name: a-repo
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
