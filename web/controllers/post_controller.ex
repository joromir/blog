defmodule Blog.PostController do
  use Blog.Web, :controller

  alias Blog.Post
  alias Blog.Repo

  def index(conn, _) do
    posts = Repo.all(Post)
    render conn, "index.html", posts: posts
  end

  def show(conn, %{"id" => id}) do
    post = Repo.get!(Post, id)
    render conn, "show.html", post: post
  end

  def edit(conn, %{ "id" => id }) do
    post = Repo.get!(Post, id)
    changeset = Post.changeset(post)
    render conn, "edit.html", post: post, changeset: changeset
  end

  def update(conn, _) do
    conn
    |> text("TODO")
  end

  def new(conn, params) do
    changeset = Post.changeset(%Post{}, params)
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"post" => post_params}) do
    changeset = Post.changeset(%Post{}, post_params)

    case Repo.insert(changeset) do
      {:ok, elem} ->
        conn
        |> text("created!")
      _ ->
        conn
        |> text("Something bad happened! :(")
    end
  end
end
