defmodule Cms2.Db.PageVersion do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "page_versions" do
    field :title,       :string
    field :description, :string
    field :keywords,    {:array, :string}
    field :content,     :string
    field :meta,        :map
    field :default,     :boolean
    field :published,   :boolean

    belongs_to :page,   Cms2.Db.Page
    belongs_to :layout, Cms2.Db.Layout
  end
end
