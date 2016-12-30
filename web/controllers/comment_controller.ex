defmodule Blog.CommentController do
  use Blog.Web, :controller

  alias Blog.Repo
  alias Blog.Post

  def create(conn, %{"comment" => comment_params, "post_id" => post_id}) do
    post = Repo.get!(Post, post_id)

    case Post.create_comment(post, comment_params) do
      {:ok, comment} ->
        conn
        |> put_flash(:info, "Saved! #{}")
        |> redirect(to: post_path(conn, :show, post))
      _ -> 
        conn
        |> text("Something really bad happened!!!")
    end
  end
end
