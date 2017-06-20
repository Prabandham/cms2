defmodule Cms2.Db.CmsAdmin do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "cms_admins" do
    field :name,             :string
    field :email,            :string
    field :crypted_password, :string

    timestamps()
  end
end