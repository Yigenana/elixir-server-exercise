defmodule LatestTest do
  use ExUnit.Case
  doctest Latest

  test "order posts accurately" do
    posts = ["1","2","3"]
    responses = [{"1", "www.test1.com"}, {"3", "www.test3.com"}, {"2", "www.test2.com"}]
    expected_output = [{"1", "www.test1.com"}, {"2", "www.test2.com"}, {"3", "www.test3.com"}]
    assert Latest.orderPosts(responses, posts) == expected_output
  end
end
