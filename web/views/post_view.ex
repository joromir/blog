defmodule Blog.PostView do
  use Blog.Web, :view

  def show_post_path(conn, post) do
    link post.title, to: post_path(conn, :show, post)
  end

  def no_comments_notification(conn, comments) do
    if Enum.count(comments) == 0, do: "Not a single comment is given for now.."
  end
end
