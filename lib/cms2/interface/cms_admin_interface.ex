defmodule Cms2.Interface.CmsAdminInterface do
  @moduledoc false
  import Ecto.Query
  alias Cms2.Db.CmsAdmin
  alias Cms2.Repo

  def all() do
    CmsAdmin
    |> Repo.all()
  end

  def get_by_email(email) do
    IO.puts email
     CmsAdmin 
     |> Repo.get_by(email: String.downcase(email))
  end

  def get_by_id(id), do: CmsAdmin |> Repo.get(id)
end