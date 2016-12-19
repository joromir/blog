defmodule Blog.PostController do
  use Blog.Web, :controller

  def index(conn, _) do
    render conn, "index.html"
  end
end
