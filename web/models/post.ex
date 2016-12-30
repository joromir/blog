defmodule Blog.Post do
  use Blog.Web, :model

  alias Blog.Comment
  alias Blog.Repo

  schema "posts" do
    field :title, :string
    field :body, :string
    field :user_id, :integer
    field :short_description, :string

    has_many :comments, Blog.Comment

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :user_id, :short_description])
    # |> validate_required([:title, :body, :user_id])
  end

  def create_comment(struct, comment_params) do
    new_comment = %Comment{}
    |> Comment.changeset(Map.merge(comment_params, %{"post_id" => struct.id}))

    if Repo.insert(new_comment), do: {:ok, new_comment}, else: {:error, "Error"}
  end
end
