let mkSourceRepository =
      λ ( options
        : (../SourceRepositoryOptions/Type.dhall).SourceRepositoryOptionsType
        ) →
      λ(name : Text) →
        (../SourceRepository/Type.dhall).Inline
          [ { mapKey = name, mapValue = options } ]

in  mkSourceRepository
