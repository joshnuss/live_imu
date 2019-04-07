defmodule Live.IMUWeb.PageController do
  use Live.IMUWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
