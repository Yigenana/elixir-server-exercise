defmodule SimpleServerTest do
  use ExUnit.Case
  doctest SimpleServer

  test "server is healthy" do
    assert SimpleServer.health() == :healthy
  end
end
