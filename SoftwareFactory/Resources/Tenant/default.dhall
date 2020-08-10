let Prelude = https://prelude.dhall-lang.org/v15.0.0/package.dhall

let tenantDefault =
      { description = None Text
      , tenant-options = None { mapKey : Text, mapValue : Text }
      , default-connection = None Text
      , allowed-reporters = None (List Text)
      , allowed-triggers = None (List Text)
      }

in  tenantDefault
