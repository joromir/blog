defmodule Blog.Router do
  use Blog.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Blog do
    pipe_through :browser

    get "/", PostController, :index

    resources "/posts", PostController do
      resources "/comments", CommentController, only: [:create]
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", Blog do
  #   pipe_through :api
  # end
end
