let Prelude = ../../Prelude.dhall

let List/map = Prelude.List.map

let SourceRepositoryType =
      < Inline :
          Prelude.Map.Type
            Text
            (../SourceRepositoryOptions/Type.dhall).SourceRepositoryOptionsType
      | Name : Text
      >

in  SourceRepositoryType
