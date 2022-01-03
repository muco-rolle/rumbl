defmodule Rumbl.Accounts do
  @moduledoc """
  Accounts context
  """

  alias Rumbl.Accounts.User

  def list_users do
    [
      %User{id: "1", name: "Muco", username: "mucort"},
      %User{id: "2", name: "Elvis", username: "oze"},
      %User{id: "3", name: "Thierry", username: "tijo"},
      %User{id: "4", name: "Libere", username: "gatarelib"}
    ]
  end

  def get_user(id) do
    list_users()
    |> Enum.find(fn user -> user.id == id end)
  end

  def get_user_by(params) do
    Enum.find(list_users(), fn user ->
      Enum.all?(
        params,
        fn {key, value} ->
          Map.get(user, key) == value
        end
      )
    end)
  end
end
