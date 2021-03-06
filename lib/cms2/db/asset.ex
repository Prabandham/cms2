defmodule Cms2.Db.Asset do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "assets" do
    field :name, :string
    field :path, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,[:name, :path])
    |> validate_required([:name, :path])
  end
end