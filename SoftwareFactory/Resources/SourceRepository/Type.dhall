let Prelude =
        env:DHALL_PRELUDE
      ? https://raw.githubusercontent.com/dhall-lang/dhall-lang/v17.0.0/Prelude/package.dhall sha256:10db3c919c25e9046833df897a8ffe2701dc390fa0893d958c3430524be5a43e
      ? https://raw.githubusercontent.com/dhall-lang/dhall-lang/v17.0.0/Prelude/package.dhall

let List/map = Prelude.List.map

let SourceRepositoryType =
      < Inline :
          Prelude.Map.Type
            Text
            (../SourceRepositoryOptions/Type.dhall).SourceRepositoryOptionsType
      | Name : Text
      >

in  SourceRepositoryType
