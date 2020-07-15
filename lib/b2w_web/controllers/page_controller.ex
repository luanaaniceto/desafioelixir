defmodule B2wWeb.PageController do
  use B2wWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
