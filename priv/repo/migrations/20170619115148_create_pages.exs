defmodule Cms2.Repo.Migrations.CreatePages do
  use Ecto.Migration

  def change do
    create table(:pages, primary_key: false) do
      add :id,          :binary_id,   primary_key: true
      add :title,       :string
      add :description, :string
      add :content,     :string,      size: 30000
      add :meta,        :map
      add :layout_id,   references(:layouts, on_delete: :nothing, type: :binary_id)
      add :keywords,    {:array,:string}
      add :default,     :boolean
      add :published,   :boolean

      timestamps()
    end

    create unique_index(:pages, [:default])
  end
end
