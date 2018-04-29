defmodule MaySecondWeb.SessionControllerTest do
  use MaySecondWeb.ConnCase

  import MaySecondWeb.AuthCase
  alias MaySecond.Accounts

  @create_attrs %{first_name: "User", last_name: "McUserson", secret: "I'm actually Canadian", email: "fred@example.com", password: "password"}
  @invalid_attrs %{email: "robin@example.com", password: "cannotGue$$it"}

  setup %{conn: conn} do
    conn = conn |> bypass_through(MaySecondWeb.Router, [:browser]) |> get("/")
    user = add_user("batman", "robin", "robin@example.com", "Iron man is better", "jinglebellsbatmansmells")
    {:ok, %{conn: conn, user: user}}
  end

  test "rendering login form fails for user that is already logged in", %{conn: conn, user: user} do
    conn = conn |> add_phauxth_session(user) |> send_resp(:ok, "/")
    conn = get(conn, session_path(conn, :new))
    assert redirected_to(conn) == page_path(conn, :index)
  end

  test "login succeeds", %{conn: conn} do
    conn = post(conn, session_path(conn, :create), session: @create_attrs)
    assert redirected_to(conn) == session_path(conn, :new)
  end

  test "login fails for user that is already logged in", %{conn: conn, user: user} do
    conn = conn |> add_phauxth_session(user) |> send_resp(:ok, "/")
    conn = post(conn, session_path(conn, :create), session: @create_attrs)
    assert redirected_to(conn) == page_path(conn, :index)
  end

  test "login fails for invalid password", %{conn: conn} do
    conn = post(conn, session_path(conn, :create), session: @invalid_attrs)
    assert redirected_to(conn) == session_path(conn, :new)
  end

  test "logout succeeds and session is deleted", %{conn: conn, user: user} do
    conn = conn |> add_phauxth_session(user) |> send_resp(:ok, "/")
    conn = delete(conn, session_path(conn, :delete, user))
    assert redirected_to(conn) == page_path(conn, :index)
    conn = get(conn, user_path(conn, :index))
    assert redirected_to(conn) == session_path(conn, :new)
    assert Accounts.list_sessions(user.id) == %{}
  end

  test "redirects to previously requested resource", %{conn: conn, user: user} do
    conn = get(conn, user_path(conn, :show, user))
    assert redirected_to(conn) == session_path(conn, :new)
    conn = post(conn, session_path(conn, :create), session: @create_attrs)
    assert redirected_to(conn) == session_path(conn, :new)
  end
end
