defmodule Cms2.Repo.Migrations.CreateComments do
  use Ecto.Migration

  def change do
    create table(:comments, primary_key: false) do
      add :id,             :binary_id,  primary_key: true
      add :post_id,        references(:posts, on_delete: :nothing, type: :binary_id)
      add :content,        :string
      add :commenter_name, :string

      timestamps()
    end
  end
end
