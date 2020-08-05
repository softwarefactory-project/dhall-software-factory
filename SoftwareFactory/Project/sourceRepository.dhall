let Prelude = https://prelude.dhall-lang.org/v15.0.0/package.dhall

let SourceRepositoryOptionsValue =
      < TextValue : Text | ListValue : List Text | BoolValue : Bool >

let SourceRepositoryOptionsType =
      Prelude.Map.Type Text SourceRepositoryOptionsValue

let SourceRepositoryType =
      < ProjectNameWithOption :
          Prelude.Map.Type Text SourceRepositoryOptionsType
      | ProjectName : Text
      >

in  { SourceRepositoryType
    , SourceRepositoryOptionsValue
    , SourceRepositoryOptionsType
    }
