defmodule Cms2.Web.Cms.AuthController do
  use Cms2.Web, :controller
  alias Cms2.Web.Router.Helpers
  plug Cms2.Plugs.SessionCheck when action in [:logout]

  def index(conn, _params) do
    conn
    |> render(:index)
  end

  def login(conn, %{"auth" => auth_params}) do
    case Cms2.Interface.AuthInterface.validate(auth_params) do
      {:ok, user} -> 
        conn
        |> put_session(:current_user, user.id)
        |> put_flash(:info, "Welcome #{user.name}.")
        |> redirect(to: Helpers.home_path(conn, :index))
      {:error, nil} ->
        conn
        |> put_flash(:error, "Invalid Login Credentials.")
        |> render(:index)
    end
  end

  def logout(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
