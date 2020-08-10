let Prelude = ../../Prelude.dhall

let List/map = Prelude.List.map

let TenantOptionsType = ./Type.dhall

let TenantOptionsValueType = ../TenantOptionsValue/Type.dhall

let render = ./render.dhall

let func = λ(option : TenantOptionsType) → render option

let pack
    : List TenantOptionsType → Prelude.Map.Type Text TenantOptionsValueType
    = λ(options : List TenantOptionsType) →
        List/map
          TenantOptionsType
          (Prelude.Map.Entry Text TenantOptionsValueType)
          func
          options

let example0 =
      let options =
            [ TenantOptionsType.zuul/web-root "https://tests.com"
            , TenantOptionsType.zuul/config-repo True
            ]

      in    assert
          :   pack options
            ≡ [ { mapKey = "zuul/web-root"
                , mapValue = TenantOptionsValueType.TextValue "https://tests.com"
                }
              , { mapKey = "zuul/config-repo"
                , mapValue = TenantOptionsValueType.BoolValue True
                }
              ]

in  pack
