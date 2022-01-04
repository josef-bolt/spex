# Spex

Spex is a small library of functional helper functions.
For now, it is only useful for `put` operations on nested maps.

## Installation

Add `spex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:spex, "~> 0.1.0"}
  ]
end
```

## Usage

### Putting into nested maps
Given a nested map `%{a: %{b: :c}}` where you want to update the value at `:b` to `:d`.
Using standard library functions you might do the following.
```
iex(1)> foo = %{a: %{b: :c}}
%{a: %{b: :c}}
iex(2)> Map.put(foo, :a, Map.put(foo.a, :b, :d))
%{a: %{b: :d}}
```

Tolerable at this depth, but not for `%{a: %{b: %{c: %{d: %{e: :f}}}}}`. Using `Spex.nested_put!/3`, you simply
```
iex(1)> Spex.nested_put!(%{a: %{b: %{c: %{d: %{e: :f}}}}}, [:a, :b, :c, :d, :e], :g)
%{a: %{b: %{c: %{d: %{e: :g}}}}}
```
