defmodule Cms2.Db.PageAsset do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "page_assets" do
    belongs_to :page,  Cms2.Db.Page
    belongs_to :asset, Cms2.Db.Asset
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params,[:page_id, :asset_id])
    |> validate_required([:page_id, :asset_id])
  end
end
