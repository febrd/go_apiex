defmodule GoApi.Conf do
  @cg_base_url Application.compile_env(:go_api, GoApi)[:cg_base_url]
  @api_key_stock Application.compile_env(:go_api, GoApi)[:api_key][:stock]
  @api_key_regional Application.compile_env(:go_api, GoApi)[:api_key][:regional]
  @api_key_places Application.compile_env(:go_api, GoApi)[:api_key][:places]
  @spv_speed Application.compile_env(:go_api, GoApi)[:spv_speed]
  @print_url Application.compile_env(:go_api, GoApi)[:print_url]

  @spec check_config() :: {:error, String.t()} | {:info, String.t()} | :ok
  def check_config do
    case { @cg_base_url, @api_key_stock, @api_key_regional, @api_key_places, @spv_speed, @print_url } do
      {<<>>, _, _, _, _, _} -> {:error, "cg_base_url is missing or empty in the config"}
      {_, <<>>, _, _, _, _} -> {:error, "api_key_stock is missing or empty in the config"}
      {_, _, <<>>, _, _, _} -> {:error, "api_key_regional is missing or empty in the config"}
      {_, _, _, <<>>, _, _} -> {:error, "api_key_places is missing or empty in the config"}
      {_, _, _, _, spv_speed, _} when spv_speed <= 0 -> {:error, "spv_speed is missing or less than or equal to 0 in the config"}
      {_, _, _, _, _, true} -> {:info, "print_url is active in the config"}
      _ -> :ok
    end
  end



  # Rest of the module remains unchanged
  def cg_base_url(), do: @cg_base_url
  def api_key_stock(), do: @api_key_stock
  def api_key_regional(), do: @api_key_regional
  def api_key_places(), do: @api_key_places
  def spv_speed(), do: @spv_speed
  def print_url(), do: @print_url
  def get_api(api_path) do
    case check_config() do
      {:error, message} ->
        {:error, message}  # You can choose how to handle the error, either return an error tuple or raise an exception
      :ok ->
        url = @cg_base_url <> api_path
        if @print_url, do: IO.puts url
        res = HTTPoison.get!(url)
        Poison.decode!(res.body)
    end
  end

  def get_api_params(api_path, params \\ %{}) do
    case check_config() do
      {:error, message} ->
        {:error, message}  # You can choose how to handle the error, either return an error tuple or raise an exception
      :ok ->
        query_params = URI.encode_query(params)
        url = @cg_base_url <> api_path <> query_params
        if @print_url, do: IO.puts url
        res = HTTPoison.get!(url)
        Poison.decode!(res.body)
    end
  end

end
