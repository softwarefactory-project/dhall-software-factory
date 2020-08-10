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
