defmodule UrlShorternerWeb.Router do
  use UrlShorternerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UrlShorternerWeb do
    pipe_through :api
    get "/:short_url_redirect", URLController, :short_url_redirect
  end

  resources "/urls", UrlShorternerWeb.URLController, only: [:create, :show, :delete]
end
