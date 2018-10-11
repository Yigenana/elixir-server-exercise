defmodule Latest do

  @apiBase "https://hacker-news.firebaseio.com/v0/"

  def fetchLatestPosts() do
    url =  @apiBase <> "topstories.json"
    %HTTPoison.Response{body: body, status_code: status_code} = HTTPoison.get!(url)
    case status_code do
      200 ->
        posts = Poison.decode!(body)
        Enum.map(posts, fn(id) -> Task.async(fn -> fetchPost(id) end) end)
        |> Enum.map(fn(task) -> Task.await(task, 145000) end)
        |> orderPosts(posts)
      _ ->
        IO.puts "Error #{status_code}"
        {:error, "Error #{status_code}"}
    end
  end

  def fetchPost(id) do
    url = @apiBase <> "item/" <> id <>".json"
    %HTTPoison.Response{body: body, status_code: status_code} = HTTPoison.get!(url)
    case status_code do
      200 ->
        body = Poison.decode!(body)
        {:ok, {body.id, body.url}}
      _ ->
        IO.puts "Error #{status_code}"
        {:error, "Error #{status_code}"}
    end
    |> (fn {:ok, response} -> response end).()
  end

  def orderPosts(responses, posts) do
    Enum.map(posts, fn(id) -> responses[id] end)
  end

end
