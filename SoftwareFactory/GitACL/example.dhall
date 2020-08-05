let GitACL = ./schema.dhall

let acl1 =
      GitACL::{
      , name = "an-acl1"
      , file =
          ''
          this is
          an ACL''
      , groups = Some [ "grp1", "grp2" ]
      }

let acl2 =
      GitACL::{
      , name = "an-acl2"
      , file =
          ''
          this is
          an ACL''
      , groups = Some [ "grp1", "grp2" ]
      }

let example0 = ./mkGitACL.dhall acl1

let example1 = ./pack.dhall [ acl1, acl2 ]

in  { example0, example1 }
