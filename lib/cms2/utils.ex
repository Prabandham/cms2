defmodule Cms2.Utils do
  @moduledoc """
    This is a utility module that replaces a string's placeholder with the given map
  """
  import EEx

  @doc """
  interpolate takes a string as the first argument and a map as the second argument and
  substutes the string with the keys in the map.

    Ex: 
      Cms2.Util("Hello {{world}}", %{world: "World !!!"})
      => "Hello World !!!"
  """
  # TODO add support for @conn (Assigns)
  def interpolate(string, map) do
    string
    |> replace_opening_curls
    |> replace_closing_curls
    |> substitute(map |> to_keyword_list)
  end

  @doc """
  This replaces the {{partial:name_of_partial}}
  with the actual content defined in that partial
  """
  defp replace_partial_place_holders(string) do
  end

  defp search_partials(string) do

  end

  defp replace_opening_curls(string), do: String.replace(string, "{{", "<%=")
  defp replace_closing_curls(string), do: String.replace(string, "}}", " %>")
  defp substitute(string, map), do: EEx.eval_string(string, map)
  defp to_keyword_list(dict), do: Enum.into(dict, [])
end