defmodule UrlShorterner.Cache do
  use GenServer

  # Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, opts, name: :morning_glory)
  end

  # Server Implementation
  def init(state) do
    IO.puts("BOOM")
    IO.inspect(state)
    {:ok, state}
  end
end
