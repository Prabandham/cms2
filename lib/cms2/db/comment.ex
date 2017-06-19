defmodule Cms2.Db.Comment do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "comments" do
    field :content, :string
    field :commenter_name, :string

    belongs_to :post, Cms2.Db.Post
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,[:content, :commenter_name, :post_id])
    |> validate_required([:content, :commenter_name, :post_id])
  end
end
