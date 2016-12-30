defmodule Blog.CommentController do
  use Blog.Web, :controller

  alias Blog.Comment
  alias Blog.Repo

  def create(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    changeset = %Comment{}
    |> Comment.changeset(Map.merge(comment_params, %{"post_id" => post_id}))

    case Repo.insert(changeset) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Saved! #{}")
        |> redirect(to: post_path(conn, :index))
      _ -> 
        conn
        |> text("Something really bad happened!!!")
    end
  end
end
