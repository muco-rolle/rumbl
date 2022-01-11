defmodule Rumbl.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:categories) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null:false

      timestamps()
    end

    create unique_index(:categories, [:name])
  end
end
