defmodule UrlShorternerWeb.URLView do
  use UrlShorternerWeb, :view
  alias UrlShorternerWeb.URLView

  def render("index.json", %{urls: urls}) do
    %{data: render_many(urls, URLView, "url.json")}
  end

  def render("show.json", %{url: url}) do
    %{data: render_one(url, URLView, "url.json")}
  end

  def render("url.json", %{url: url}) do
    %{id: url.id,
      long_url: url.long_url}
  end
end
