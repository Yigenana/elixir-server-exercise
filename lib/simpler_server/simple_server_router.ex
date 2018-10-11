defmodule SimpleServer.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger

  plug(Plug.Logger, log: :debug)

  plug(:match)
  plug(:dispatch)

  get "/health" do
    send_resp(conn, 200, "healthy!")
  end

  get "/latest" do
    send_resp(conn, 200, "TO DO")
  end

  post "/new" do
    {:ok, body, conn} = read_body(conn)
    body = Poison.decode!(body)
    IO.inspect(body)
    send_resp(conn, 201, "created new item: #{get_in(body, ["message"])}")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
