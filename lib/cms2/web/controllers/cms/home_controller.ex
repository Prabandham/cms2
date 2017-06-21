defmodule Cms2.Web.Cms.HomeController do
  @moduledoc false
  use Cms2.Web, :controller

  def index(conn, _praams) do
    # TODO show tutorial kinda for steps that have to be taken.
    render(conn, :index)
  end
end
