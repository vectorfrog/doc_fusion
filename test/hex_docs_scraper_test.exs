defmodule HexDocsScraperTest do
  use ExUnit.Case
  doctest HexDocsScraper

  test "greets the world" do
    assert HexDocsScraper.hello() == :world
  end
end
