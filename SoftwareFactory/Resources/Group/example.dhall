let Group = ./schema.dhall

let group1 = Group::{ name = "a-group1", members = Some [ "john", "jane" ] }

let group2 = Group::{ name = "a-group2", members = Some [ "john", "jane" ] }

let example0 = ./mkGroup.dhall group1

let example1 = ./pack.dhall [ group1, group2 ]

in  { example0, example1 }
