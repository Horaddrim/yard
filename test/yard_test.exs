defmodule YardTest do
  use ExUnit.Case
  doctest Yard

  test "greets the world" do
    assert Yard.hello() == :world
  end
end
