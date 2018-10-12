defmodule LatestTest do
  use ExUnit.Case
  doctest Latest

  import Mock

  test "order posts accurately" do
    posts = ["1","2","3"]
    responses = [{"1", "www.test1.com"}, {"3", "www.test3.com"}, {"2", "www.test2.com"}]
    expected_output = [{"1", "www.test1.com"}, {"2", "www.test2.com"}, {"3", "www.test3.com"}]
    assert Latest.orderPosts(responses, posts) == expected_output
  end

  test_with_mock "fetch posts success", HTTPoison,
     [get: fn(_url) -> '{"id":"123", "body":"text", "url":"url"}' end] do
      HTTPoison.get!("https://hacker-news.firebaseio.com/v0/item/123.json")
      response = Latest.fetchPost("123")
      assert_called HTTPoison.get!("https://hacker-news.firebaseio.com/v0/item/123.json")
      assert response == {"123", "url"}
  end

  test_with_mock "fetch posts failure", HTTPoison,
     [get: fn(_url) -> '{"id":"123", "body":"text", "url":"url"}' end] do
      HTTPoison.get!("https://hacker-news.firebaseio.com/v0/item/123.json")
      response = Latest.fetchPost("123")
      assert_called HTTPoison.get!("https://hacker-news.firebaseio.com/v0/item/123.json")
      assert response == {"123", "url"}
  end

end
