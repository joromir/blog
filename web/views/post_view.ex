defmodule Blog.PostView do
  use Blog.Web, :view

  def show_post_path(conn, post) do
    link post.title, to: post_path(conn, :show, post)
  end

  def new_post_button(conn) do
    link "New Post", to: post_path(conn, :new), class: 'btn btn-success btn-lg'
  end

  def no_comments_notification(conn, comments) do
    if Enum.count(comments) == 0, do: "Not a single comment is given yet.."
  end
end
