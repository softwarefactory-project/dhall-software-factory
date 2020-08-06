--| This higher order function generate the pack function

let Prelude = ../Prelude.dhall

let packer
    : forall (a : Type) ->
      forall (f : a -> Prelude.Map.Entry Text a) ->
      forall (l : List a) ->
        Prelude.Map.Type Text a
    = \(a : Type) ->
      \(f : a -> Prelude.Map.Entry Text a) ->
      \(l : List a) ->
        Prelude.List.map a (Prelude.Map.Entry Text a) f l

in  packer
