defmodule Blog.PostView do
  use Blog.Web, :view

  def show_post_path(conn, post) do
    link post.title, to: post_path(conn, :show, post)
  end
end
