defmodule Cms2.Web.Router do
  use Cms2.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scape "/cms", Cms2.Web do
    pipe_through :browser

    get "/", AuthController, :index
    post "/login", AuthController, :login

    resources "/layouts", LayoutsController
    resources "/pages", PagesController
    resources "/partials", PartialsController
    resources "/posts", PartialsController
    resources "assets", AssetsController
  end

  scope "/", Cms2.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cms2.Web do
  #   pipe_through :api
  # end
end
