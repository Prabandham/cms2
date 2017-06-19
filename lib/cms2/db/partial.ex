defmodule Cms2.Db.Partial do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "partials" do
    field :name, :string
    field :content, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,[:name, :content])
    |> validate_required([:name, :content])
    |> unique_constraint(:name)
  end
end