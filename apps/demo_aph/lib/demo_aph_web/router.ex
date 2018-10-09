defmodule DemoAphWeb.Router do
  use DemoAphWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :authentication do
    plug BasicAuth, use_config: {:demo_aph, :authentication}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DemoAphWeb do
    pipe_through [:browser, :authentication]
    get "/", PageController, :index
    get "/date", PageController, :date
  end

  # Other scopes may use custom stacks.
  # scope "/api", DemoAphWeb do
  #   pipe_through :api
  # end
end
