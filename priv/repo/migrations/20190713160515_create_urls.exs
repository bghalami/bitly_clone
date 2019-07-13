defmodule UrlShorterner.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :long_url, :string

      timestamps()
    end

  end
end
