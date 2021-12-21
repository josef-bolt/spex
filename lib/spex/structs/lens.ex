defmodule Spex.Structs.Lens do
  @enforce_keys [:view, :update]
  defstruct [:view, :update]
end
