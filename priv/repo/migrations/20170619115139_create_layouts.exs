defmodule Cms2.Repo.Migrations.CreateLayouts do
  use Ecto.Migration

  def change do
    create table(:layouts, primary_key: false) do
      add :id,          :binary_id, primary_key: true
      add :name,        :string
      add :description, :string
      add :content,     :string,    size: 30000

      timestamps()
    end
    create unique_index(:layouts, [:name])
  end
end
