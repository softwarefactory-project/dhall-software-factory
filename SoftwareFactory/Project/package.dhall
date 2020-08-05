{ Type = ./Type.dhall
, default = ./default.dhall
, mkSourceRepository = ./mkSourceRepository.dhall
, SourceRepositoryType = (./sourceRepository.dhall).SourceRepositoryType
, SourceRepositoryOptionsType =
    (./sourceRepository.dhall).SourceRepositoryOptionsType
, SourceRepositoryOptionsValue =
    (./sourceRepository.dhall).SourceRepositoryOptionsValue
, mkProject = ./mkProject.dhall
}
