defmodule MaySecondWeb.TodoController do
  use MaySecondWeb, :controller
  alias MaySecond.Repo

  def create(%{"todo" => todo_params}) do
    Repo.insert(todo_params)
  end
end
