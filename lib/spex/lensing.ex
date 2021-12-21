defmodule Spex.Lensing do
  alias Spex.Structs.Lens

  @doc """
  Sequential composition of lenses.
  """

  @spec seq(%Lens{}, %Lens{}) :: %Lens{}
  def seq(
        %Lens{view: view_1, update: update_1},
        %Lens{view: view_2, update: update_2}
      ) do
    new_view = fn x ->
      x |> view_2.() |> view_1.()
    end

    new_update = fn {x, q} ->
      y = view_2.(x)
      r = update_1.({y, q})
      update_2.({x, r})
    end

    %Lens{view: new_view, update: new_update}
  end
end
