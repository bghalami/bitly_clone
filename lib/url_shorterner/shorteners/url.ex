defmodule UrlShorterner.Shorteners.URL do
  use Ecto.Schema
  import Ecto.Changeset

  schema "urls" do
    field :long_url, :string

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:long_url])
    |> validate_required([:long_url])
    |> unique_constraint(:long_url)
  end
end
