defmodule Rumbl.Accounts do
  @moduledoc """
  Accounts context
  """

  alias Rumbl.Accounts.User
  alias Rumbl.Repo

  def list_users(), do: Repo.all(User)

  def get_user(id), do: Repo.get(User, id)

  def get_user!(id), do: Repo.get!(User, id)

  def get_user_by(params), do: Repo.get_by!(User, params)

  def change_user(%User{} = user), do: User.changeset(user, %{})
end