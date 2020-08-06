--| The dhall-software-factory entry point

{ Connection =
    ./SoftwareFactory/Connection/package.dhall sha256:68dc73564718025ae8dbdcc0f04f2b5e1560063f2818b7f7c2e5c13198e20a9b
, GitACL =
    ./SoftwareFactory/GitACL/package.dhall sha256:60a2ace89e9112af2d3e062ade3d74077a9b77ff8e77ffb6bd2ea74a087cc838
, GitRepository =
    ./SoftwareFactory/GitRepository/package.dhall sha256:f414c6ea1aea89e33e9b20c1cfaf9df47e3f133e06547c71f8353a315a3594a7
, Group =
    ./SoftwareFactory/Group/package.dhall sha256:d01050fec50f3fc3132586074c3440eef6169a18ec29fd33963afd6ac4352f2f
, Project =
    ./SoftwareFactory/Project/package.dhall sha256:e41ec00eac35873f43b902f9570cb2557102e3c195fcba3c0ad684c7abea3c59
, Resources =
    ./SoftwareFactory/Resources/package.dhall sha256:8ebb16ed07bfd7b690ea0f7b897776e87c7c6915635de193e5be986a30b1de1d
, SourceRepository =
    ./SoftwareFactory/SourceRepository/package.dhall sha256:5faec3802f34f675f19970391182850863791ce84af13f0b7c0a480782860ba8
, SourceRepositoryOptions =
    ./SoftwareFactory/SourceRepositoryOptions/package.dhall sha256:624c2cdce44675d3730d474412d4907f30ab4fdfe2c2ecf29c03e9230480df6d
, Tenant =
    ./SoftwareFactory/Tenant/package.dhall sha256:48c52c02410a6ae3405d387b6813817f82ee969bfd9360000de3aa83bc2cee12
}
