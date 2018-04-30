# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# It is also run when you use the command `mix ecto.setup`
#

users = [
  %{first_name: "User", last_name: "McUserson", secret: "I'm actually Canadian", email: "fred@example.com", password: "password", role: "Buyer"},
  %{first_name: "Wrath Of", last_name: "Conn", email: "conn!@example.com", secret: "I cried when Spock died", password: "password", role: "Buyer"},
  %{first_name: "Admin", last_name: "McAdminson", secret: "I chew gum to prevent my double chin", email: "admin@example.com", password: "password", role: "Seller", admin: true},
  %{first_name: "Jim", last_name: "Jameson", secret: "I always carry two pennies with me so if someone asks me for my two cents, I'll be ready.", email: "james@example.com", password: "password", role: "Seller"},
  %{first_name: "James", last_name: "Kirk", secret: "I rather fly the excelsior!", email: "Kirky@example.com", password: "password", role: "Seller"}
]

for user <- users do
  {:ok, _} = MaySecond.Accounts.create_user(user)
end
