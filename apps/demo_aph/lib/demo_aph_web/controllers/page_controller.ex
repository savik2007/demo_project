defmodule DemoAphWeb.PageController do
  use DemoAphWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def date() do
    date_time = :calendar.local_time()
    now = :calendar.datetime_to_gregorian_seconds(date_time)
    %{now: now}
  end
end
