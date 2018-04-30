defmodule MaySecondWeb.PageControllerTest do
  use MaySecondWeb.ConnCase

 
  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Authentication with Phauxth!"
  end

  test "GET /getting_started", %{conn: conn} do
    conn = get conn, "/getting_started"
    assert html_response(conn, 200) =~ "Getting Started"
  end
end
