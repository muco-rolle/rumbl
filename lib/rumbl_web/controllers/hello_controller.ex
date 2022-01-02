defmodule RumblWeb.HelloController do
  use RumblWeb, :controller

  def hello(conn, %{"name" => name}) do
    render(conn, "index.html", name: name)
  end
end
