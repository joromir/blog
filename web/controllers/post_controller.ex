defmodule Blog.PostController do
  use Blog.Web, :controller

  alias Blog.Post
  alias Blog.Repo

  def index(conn, _) do
    posts = Repo.all(Post)
    render conn, "index.html", posts: posts
  end

  def edit(conn, %{ "id" => id }) do
    post = Repo.get!(Post, id)
    render conn, "edit.html", post: post
  end

  def new(conn, params) do
    changeset = Post.changeset(%Post{}, params)
    render conn, "new.html", changeset: changeset
  end
end
