defmodule Cms2.Repo.Migrations.CreatePartials do
  use Ecto.Migration

  def change do
    create table(:partials, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :content, :string, size: 30000

      timestamps()
    end

    create unique_index(:partials, [:name])
  end
end
