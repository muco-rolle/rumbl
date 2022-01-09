defmodule RumblWeb.SessionController do
  use RumblWeb, :controller

  alias Rumbl.Accounts

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"session" => session}) do
    %{"username" => username, "password" => password} = session

    case Accounts.login(username, password) do
      {:ok, user} ->
        conn
        |> RumblWeb.Auth.create_session(user)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _params) do
    conn
    |> RumblWeb.Auth.delete_session()
    |> put_flash(:ok, "Logged out successfully")
    |> redirect(to: Routes.page_path(conn, :index))
  end
end