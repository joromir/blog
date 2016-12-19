defmodule Blog.PostController do
  use Blog.Web, :controller

  def index(conn, _) do
    render conn, "index.html"
  end

  def new(conn, _params) do
    changeset = Post.changeset(%Post{})
    render(conn, "new.html", changeset: changeset)
  end
end
