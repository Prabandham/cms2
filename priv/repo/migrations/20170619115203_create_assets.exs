defmodule Cms2.Repo.Migrations.CreateAssets do
  use Ecto.Migration

  def change do
    create table(:assets, primary_key: false) do
      add :id,   :binary_id, primary_key: true
      add :name, :string
      add :path, :string

      timestamps()
    end
  end
end
