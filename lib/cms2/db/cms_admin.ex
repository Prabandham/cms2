defmodule Cms2.Db.CmsAdmin do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "cms_admins" do
    field :name,             :string
    field :email,            :string
    field :password,         :string, virtual: true
    field :crypted_password, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :password])
    |> validates_required([:name, :email, :password])
    |> validates_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> hash_password
  end

  defp hash_password(changeset) do
    changeset
    |> put_change(:crypted_password, Comeonin.Bcrypt.hashpwsalt(changeset.changes[:password]))
  end
end
