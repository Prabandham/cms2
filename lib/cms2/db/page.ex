defmodule Cms2.Db.Page do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "pages" do
    field :title, :string
    field :description, :string
    field :content, :string
    field :meta, :map
    field :keywords, {:array, :string}
    field :default, :boolean
    field :published, :boolean
    belongs_to :layout, Cms2.Db.Layout

    timestamps()
  end

  def changeset() do
    # TODO
  end
end
