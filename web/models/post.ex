defmodule Blog.Post do
  use Blog.Web, :model

  schema "posts" do
    field :title, :string
    field :body, :string
    field :user_id, :integer
    field :short_description, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :body, :user_id, :short_description])
    # |> validate_required([:title, :body, :user_id])
  end
end
