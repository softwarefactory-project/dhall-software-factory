let Prelude = ../Prelude.dhall

let SourceRepositoryOptionsValueType =
      < TextValue : Text | ListValue : List Text | BoolValue : Bool >

let SourceRepositoryOptionsType =
      Prelude.Map.Type Text SourceRepositoryOptionsValueType

in  { SourceRepositoryOptionsType, SourceRepositoryOptionsValueType }
