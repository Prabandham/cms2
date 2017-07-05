defmodule Cms2.Web.PageController do
  use Cms2.Web, :controller

  plug :put_layout, false

  def index(conn, %{"page" => [page_slug]}) do
    if page_slug do
#         Find the page by the name / slug and send it
    end
  end

  def index(conn, %{"page" => []}) do
    page = Cms2.Db.Page |> Cms2.Repo.get_by(default: true, published: true) |> Cms2.Repo.preload(:layout)
    page_content = page.content
    layout = page.layout
    main_layout_template = Liquid.Template.parse(layout.content)
    {:ok, rendered, _} = Liquid.Template.render(main_layout_template, %{"page_content" => page.content, "page_title" => page.title})
    render(conn, "index.html", page: rendered)
  end
end
