defmodule UrlShorterner.Repo.Migrations.AddingUniqueConstaintToLongUrl do
  use Ecto.Migration

  def change do
   create unique_index(:urls, [:long_url])
 end
 
end
