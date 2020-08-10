let Prelude = ../../Prelude.dhall

let TenantOptions = ./schema.dhall

let OptionValueType = < TextValue : Text | BoolValue : Bool >

let render
    : TenantOptions.Type → Prelude.Map.Entry Text OptionValueType
    = λ(option : TenantOptions.Type) →
        merge
          { zuul/report-build-page =
              λ(val : Bool) →
                { mapKey = "zuul/report-build-page"
                , mapValue = OptionValueType.BoolValue val
                }
          , zuul/config-repo =
              λ(val : Bool) →
                { mapKey = "zuul/config-repo"
                , mapValue = OptionValueType.BoolValue val
                }
          , zuul/web-root =
              λ(val : Text) →
                { mapKey = "zuul/web-root"
                , mapValue = OptionValueType.TextValue val
                }
          }
          option

let example0 =
      let option = TenantOptions.Type.zuul/web-root "https://test.com"

      in    assert
          :   render option
            ≡ { mapKey = "zuul/web-root"
              , mapValue = OptionValueType.TextValue "https://test.com"
              }

in  render
