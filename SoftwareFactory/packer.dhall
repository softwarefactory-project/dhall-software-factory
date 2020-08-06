--| This higher order function generate the pack function

let Prelude = ../Prelude.dhall

let packer
    : ∀(a : Type) →
      ∀(f : a → Prelude.Map.Entry Text a) →
      ∀(l : List a) →
        Prelude.Map.Type Text a
    = λ(a : Type) →
      λ(f : a → Prelude.Map.Entry Text a) →
      λ(l : List a) →
        Prelude.List.map a (Prelude.Map.Entry Text a) f l

in  packer
