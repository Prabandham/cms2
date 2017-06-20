defmodule Cms2.Web.Cms.HomeController do
  @moduledoc false
  use Cms2.Web, :controller

  def index(conn, _praams) do
    render(conn, :index)
  end
end