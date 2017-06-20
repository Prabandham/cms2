defmodule Cms2.Db.Post do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "posts" do
    field :name, :string
    field :title, :string
    field :content, :string
    field :publisher_name, :string

    has_many :comments, Cms2.Db.Comment
    timestamps()
  end
end