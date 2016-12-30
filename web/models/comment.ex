defmodule Blog.Comment do
  use Blog.Web, :model

  schema "comments" do
    field :body, :string
    belongs_to :post, Blog.Post

    timestamps
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:body, :post_id])
  end
end
