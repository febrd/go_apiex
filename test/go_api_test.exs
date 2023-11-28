defmodule GoApiTest do
  use ExUnit.Case
  doctest GoApi

  test "greets the world" do
    assert GoApi.hello() == :world
  end
end
