defmodule Rumbl.Accounts.User do
  @moduledoc """
  User struct
  """

  use Ecto.Schema

  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    field :name, :string
    field :username, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
  end
end