defmodule DemoAphWeb.GreetChannel do
  use Phoenix.Channel
  def join("room:greet", _message, socket) do
    {:ok, socket}
  end
  def greet("room:greet", name, socket) do
    greet = Greeter.hello(name)
    {:ok, greet}
  end
#  @spec handle_in(String.t(), map(), any()) ::  {:noreply, any()}
  def handle_in("greet", %{"name" => name}, socket) do
    broadcast! socket, "greet", %{msg: Greeter.hello(name)}
    {:noreply, socket}
  end
end
