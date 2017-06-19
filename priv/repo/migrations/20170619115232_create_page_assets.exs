defmodule Cms2.Repo.Migrations.CreatePageAssets do
  use Ecto.Migration

  def change do
    create table(:page_assets) do
      add :page_id,  references(:pages, on_delete: :nothing, type: :binary_id)
      add :asset_id, references(:assets, on_delete: :nothing, type: :binary_id)
    end

    create unique_index(:page_assets, [:page_id, :asset_id])
  end
end
