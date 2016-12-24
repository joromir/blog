defmodule Blog.Repo.Migrations.AddShortDescriptionToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :short_description, :text
    end
  end
end
