defmodule Cms2.Db.Layout do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "layouts" do
    field :name, :string
    field :description, :string
    field :content, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,[:name, :description, :content])
    |> validate_required([:name, :description, :content])
    |> unique_constraint(:name)
  end
end
