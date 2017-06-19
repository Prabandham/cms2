defmodule Cms2.Web.PageController do
  use Cms2.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
