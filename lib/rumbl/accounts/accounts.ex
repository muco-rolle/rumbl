defmodule Rumbl.Accounts do
  @moduledoc """
  Accounts context
  """

  alias Rumbl.{Repo, Accounts.User}
  import Argon2

  def list_users(), do: Repo.all(User)

  def get_user(id), do: Repo.get(User, id)

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by(params), do: Repo.get_by!(User, params)

  def change_user(%User{} = user), do: User.signup_changeset(user, %{})

  def change_signup(%User{} = user), do: User.signup_changeset(user, %{})

  def create_user(params) do
    %User{}
    |> User.signup_changeset(params)
    |> Repo.insert()
  end

  def login(username, password) do
    user = get_user_by(username: username)

    cond do
      user && verify_pass(password, user.password_hash) ->
        {:ok, user}

      user ->
        {:error, :unauthorized}

      true ->
        no_user_verify()
        {:error, :not_found}
    end
  end
end
