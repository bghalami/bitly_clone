defmodule UrlShorterner.Cache do
  use GenServer

  alias UrlShorterner.Shorteners

  # Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def insert_url(url) do
    GenServer.call(__MODULE__, {:insert_url, url})
  end

  # Server Implementation
  def init(state) do

    {:ok, state, {:continue, :load_urls}}
  end

  def handle_call({:insert_url, url}, _from, state) do
    ConCache.put(:my_cache, url.id, url.long_url)
    {:reply,{:ok, url}, state}
  end

  def handle_continue(:load_urls, state) do
    Shorteners.list_urls()
    |> IO.inspect()
    |> Enum.each(fn url ->
        IO.inspect url
        ConCache.put(:my_cache, url.id, url.long_url)
      end)
      
    {:noreply, state}
  end
end
