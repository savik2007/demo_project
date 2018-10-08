defmodule DemoAphWeb.PageController do
  use DemoAphWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
