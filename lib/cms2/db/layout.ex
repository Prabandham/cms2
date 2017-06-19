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

  def changeset() do
    # TODO
  end
end
