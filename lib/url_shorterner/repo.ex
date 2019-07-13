defmodule UrlShorterner.Repo do
  use Ecto.Repo,
    otp_app: :url_shorterner,
    adapter: Ecto.Adapters.Postgres
end
