defmodule MaySecondWeb.PageController do
  use MaySecondWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def getting_started(conn, _params) do
    render conn, "getting_started.html"
  end
  def admin(conn, _params) do
    render conn, "admin.html"
  end

  def buyer(conn, _params) do
    render conn, "buyer.html"
  end

end
