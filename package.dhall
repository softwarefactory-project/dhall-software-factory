--| The dhall-software-factory entry point

{ Connection =
    ./SoftwareFactory/Connection/package.dhall sha256:3a57414af11c000a638bede3f245848eea2e91143a5b24d2783ab502973893be
, ConnectionType =
    ./SoftwareFactory/ConnectionType/package.dhall sha256:917a86eb8354ccff50a0d559f0b4ced67ca690a5c5563dcdaa362e9800886fcd
, GitACL =
    ./SoftwareFactory/GitACL/package.dhall sha256:60a2ace89e9112af2d3e062ade3d74077a9b77ff8e77ffb6bd2ea74a087cc838
, GitRepository =
    ./SoftwareFactory/GitRepository/package.dhall sha256:f414c6ea1aea89e33e9b20c1cfaf9df47e3f133e06547c71f8353a315a3594a7
, Group =
    ./SoftwareFactory/Group/package.dhall sha256:d01050fec50f3fc3132586074c3440eef6169a18ec29fd33963afd6ac4352f2f
, Project =
    ./SoftwareFactory/Project/package.dhall sha256:e41ec00eac35873f43b902f9570cb2557102e3c195fcba3c0ad684c7abea3c59
, Resources =
    ./SoftwareFactory/Resources/package.dhall sha256:c8b826257358a68bab53d2c1240e01302c87e4e60039336372f6b4b3d432e875
, SourceRepository =
    ./SoftwareFactory/SourceRepository/package.dhall sha256:5faec3802f34f675f19970391182850863791ce84af13f0b7c0a480782860ba8
, SourceRepositoryOptions =
    ./SoftwareFactory/SourceRepositoryOptions/package.dhall sha256:624c2cdce44675d3730d474412d4907f30ab4fdfe2c2ecf29c03e9230480df6d
, Tenant =
    ./SoftwareFactory/Tenant/package.dhall sha256:48c52c02410a6ae3405d387b6813817f82ee969bfd9360000de3aa83bc2cee12
}
