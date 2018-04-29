defmodule MaySecond.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias MaySecond.Repo


  schema "todos" do
    field :completed, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :completed])
    |> validate_required([:name, :completed])
  end

  def new_todo(changeset)

  def incomplete_todos do

  end
end
