defmodule Cms2.Repo.Migrations.CreatePageVersions do
  use Ecto.Migration

  def change do
    create table(:page_versions, primary_key: :false) do
      add :id,          :binary_id,   primary_key: true
      add :title,       :string
      add :description, :string
      add :keywords,    {:array, :string}
      add :content,     :string,      size: 30000
      add :meta,        :map
      add :page_id,     references(:pages, on_delete: :nothing, type: :binary_id)
      add :layout_id,   references(:layouts, on_delete: :nothing, type: :binary_id)
      add :default,     :boolean
      add :published,   :boolean

      timestamps()
    end
  end
end
