defmodule GoApi.Spv do
  use GenServer
  import GoApi.Conf
  @api_key_stock api_key_stock()
  @spv_speed spv_speed()

  def start_link(_param) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def init(state) do
    {:ok, state}
  end

  defp handle_update(endpoint, state) do
    response = get_api_params("stock/idx/#{endpoint}?api_key=#{@api_key_stock}")
    IO.inspect(response, label: "#{String.capitalize(endpoint)} Response")
    Process.send_after(self(), String.to_atom("update_#{endpoint}"), @spv_speed)
    state
  end

  def handle_cast({:update, endpoint}, state) do
    handle_update(endpoint, state)
  end

  def handle_info({:update, endpoint}, state) do
    handle_update(endpoint, state)
  end

  def e_ipo(state) do
    handle_update("e-ipo", state)
  end

  def trending(state) do
    handle_update("trending", state)
  end

  def top_gainers(state) do
    handle_update("top_gainer", state)
  end

  def top_losers(state) do
    handle_update("top_loser", state)
  end

  def companies(state) do
    handle_update("companies", state)
  end

  def indices(state) do
    handle_update("indices", state)
  end

  def update(endpoint) do
    GenServer.cast(__MODULE__, {:update, endpoint})
  end
end
