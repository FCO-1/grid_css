defmodule GridCssWeb.Router do
  use GridCssWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {GridCssWeb.LayoutView, :prueba1}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", GridCssWeb do
    pipe_through :browser

    live "/", PageLive, :index

    live "/prueba1", Prueba1Live.Index, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", GridCssWeb do
  #   pipe_through :api
  # end
end
