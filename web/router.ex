defmodule Splurty.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", Splurty do
    pipe_through :browser # Use the default browser stack

    get "/", QuoteController, :homepage
    get "/send_sms", SMSController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Splurty do
  #   pipe_through :api
  # end
end
