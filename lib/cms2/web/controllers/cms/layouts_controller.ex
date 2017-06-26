defmodule Cms2.Web.Cms.LayoutsController do
  use Cms2.Web, :controller

  def new(conn, _params) do
    changeset = Cms2.Interface.LayoutInterface.new()
    render(conn, chageset: changeset)
  end

  def create(conn, %{"layout" => layout_params}) do
  end

  def show(conn, _params) do
    render(conn, :index)
  end

  def edit(conn, %{"id" => id}) do
  end

  def update(conn, %{"id" => id} = layout_params) do
  end
end
