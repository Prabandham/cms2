defmodule Cms2.Plugs.SessionCheck do
  import Plug.Conn
  import Phoenix.Controller

  def init(default), do: default

  def call(conn, default) do
    current_user = get_session(conn, :current_user)
    # TODO Validate the user against the database.
    if current_user do
      assign(conn, :current_user, current_user)
    else
      conn
        |> put_flash(:error, 'You need to be signed in to view this page')
        |> redirect(to: "/cms/")
        |> halt()
    end
  end
end