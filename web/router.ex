defmodule Arya.Router do
  use Arya.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Arya do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/", PageController, :index
    resources "/users", UserController
    resources "/jobs", JobController
    resources "/jobbs", JobbController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Arya do
  #   pipe_through :api
  # end
end
