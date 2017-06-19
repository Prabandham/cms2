defmodule Cms2.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id,             :binary_id, primary_key: true
      add :name,           :string
      add :title,          :string
      add :content,        :string,    size: 30000
      add :publisher_name, :string

      timestamps()
    end
  end
end
