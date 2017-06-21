defmodule Cms2.Interface.LayoutInterface do
  @moduledoc false

  import Ecto.Query
  alias Cms2.Db.Layout
  alias Cms2.Repo

  def default_layout() do
    Layout
    |> Repo.get_by(default: true)
  end

  def new() do
    Layout.chageset(%Layout{}, %{})
  end

  def all() do
    Layout
    |> Repo.all()
  end

  def create(changeset) do
    Repo.insert(changeset)
  end

  def update(changeset) do
    Repo.update(changeset)
  end
end
