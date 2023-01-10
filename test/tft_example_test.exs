defmodule TftExampleTest do
  use ExUnit.Case
  doctest TftExample

  test "greets the world" do
    assert TftExample.hello() == :world
  end
end
