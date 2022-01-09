defmodule Rumbl.Accounts do
  @moduledoc """
  Accounts context
  """

  alias Rumbl.{Repo, Accounts.User}

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
end
