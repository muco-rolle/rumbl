defmodule Rumbl.Accounts.User do
  @moduledoc """
  User struct
  """

  use Ecto.Schema

  import Ecto.Changeset
  import Argon2

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, [:name, :username])
    |> validate_required([:name, :username])
    |> validate_length(:username, min: 1, max: 20)
    |> unique_constraint(:username)
  end

  def signup_changeset(user, params) do
    user
    |> changeset(params)
    |> cast(params, [:password])
    |> validate_required([:password])
    |> validate_length(:password, min: 3, max: 100)
    |> hash_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true} ->
        %{changes: %{password: password}} = changeset
        put_change(changeset, :password_hash, hash_pwd_salt(password))

      _ ->
        changeset
    end
  end
end
