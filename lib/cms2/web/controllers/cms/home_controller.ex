defmodule Cms2.Web.Cms.HomeController do
  @moduledoc false
  use Cms2.Web, :controller
  plug Cms2.Plugs.SessionCheck

  def index(conn, _praams) do
    # TODO show tutorial kinda for steps that have to be taken.
    render(conn, :index)
  end
end
