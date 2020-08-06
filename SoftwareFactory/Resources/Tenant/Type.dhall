let Prelude = https://prelude.dhall-lang.org/v15.0.0/package.dhall

let tenantType =
      { name : Text
      , url : Text
      , description : Optional Text
      , tenant-options : Optional (Prelude.Map.Type Text Text)
      , default-connection : Optional Text
      , allowed-reporters : Optional (List Text)
      , allowed-triggers : Optional (List Text)
      }

in  tenantType
