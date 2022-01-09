defmodule RumblWeb.Auth do
  @moduledoc """
  Auth Controller
  """

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    user_id = get_session(conn, :user_id)
    user = user_id && Rumbl.Accounts.get_user(user_id)

    assign(conn, :current_user, user)
  end
end
