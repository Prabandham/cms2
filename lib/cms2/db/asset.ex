defmodule Cms2.Db.Asset do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Chageset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "assets" do
    field :name, :string
    field :path, :string

    timestamps()
  end

  def changeset() do
    # TODO
  end
end
