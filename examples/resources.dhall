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
