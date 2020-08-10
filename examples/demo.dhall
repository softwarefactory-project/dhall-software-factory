let SoftwareFactory = ../package.dhall

let SFResources = SoftwareFactory.Resources

let mkGroup = SFResources.Group.mkGroup

let mkProject = SFResources.Project.mkProject

let mkSourceRepository = SFResources.Project.mkSourceRepository

let SourceRepository = SFResources.SourceRepository

let SourceRepositoryOptions = SFResources.SourceRepositoryOptions

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

let group1 =
      SFResources.Group::{ name = "group1", description = Some "The group 1" }

let groups = SFResources.Group.pack [ group1 ]

let tenants =
      SFResources.Tenant.pack
        [ SFResources.Tenant::{
          , name = "local"
          , url = "https://softwarefactory-project.io/manage"
          , description = Some "The local tenant"
          , tenant-options = Some
            [ { mapKey = "zuul/report-build-page", mapValue = "True" } ]
          }
        ]

let projects =
      [ mkProject
          SFResources.Project::{
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
