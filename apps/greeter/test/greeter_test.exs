defmodule GreeterTest do
  use ExUnit.Case
#  doctest Greeter

  test "greets the world" do
    assert Greeter.hello("world") == "Hello world"
  end
end
