defmodule Spex do
  alias Spex.Lensing
  alias Spex.Structs.Lens

  @moduledoc """
  Documentation for `Spex`.
  """

  @doc """
  Puts `value` in a nested map `map` under a location specified by `path`.
  Raises if `map` does not contain the intermediate keys in `path`


  ## Examples

      iex> Spex.nested_put!(%{a: %{b: %{c: :d}}}, [:a, :b, :c], :e)
      %{a: %{b: %{c: :e}}}
  """

  @spec nested_put!(map :: map(), path :: list(), value :: any()) :: map()
  def nested_put!(map, path, value) do
    lens =
      path
      |> Enum.map(&generate_key_lens/1)
      |> Enum.reduce(&Lensing.seq/2)

    lens.update.({map, value})
  end

  defp generate_key_lens(key) do
    %Lens{
      view: fn
        map -> Map.fetch!(map, key)
      end,
      update: fn {map, val} -> Map.put(map, key, val) end
    }
  end
end
