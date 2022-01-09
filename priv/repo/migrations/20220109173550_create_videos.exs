defmodule Rumbl.Repo.Migrations.CreateVideos do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:videos) do
      add :id, :binary_id, primary_key: true
      add :url, :string
      add :title, :string
      add :description, :text
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:videos, [:user_id])
  end
end
