defmodule Cms2.Repo.Migrations.CreateCmsAdmins do
  use Ecto.Migration

  def change do
    create table(:cms_admins, primary_key: false) do
      add :id,               :binary_id, primary_key: true
      add :name,             :string
      add :email,            :string
      add :crypted_password, :string

      timestamps()
    end

    create unique_index(:cms_admins, [:email])
  end
end
