defmodule Cms2.Interface.AuthInterface do
  @moduledoc false
  alias Cms2.Db.CmsAdmin
  import Ecto.Query

  def validate(user_params) do
    user = Cms2.Interface.CmsAdminInterface.get_by_email(user_params["email"])
    case authenticate(user, user_params["password"]) do
      true -> {:ok, user}
      _    -> {:error, nil}
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user)
    if id, do: Cms2.Interface.CmsAdminInterface.get_by_id(id)
  end

  def logged_in?(conn), do: !!current_user(conn)

  defp authenticate(user, password) do
    case user do
      nil -> false
      _   -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end
end