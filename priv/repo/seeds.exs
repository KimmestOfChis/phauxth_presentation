# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# It is also run when you use the command `mix ecto.setup`
#

users = [
  %{first_name: "Matthew", last_name: "McMatherson", email: "john.doe@example.com", secret: "I look into the mirror every time I cry so I'd see how I would look like when I make it big on TV one day", password: "password"},
  %{first_name: "Admin", last_name: "McAdminson", email: "imaadmin@example.com", secret: "I always carry two pennies with me so if someone asks me for my two cents, I'll be ready. ", password: "adminpassword", admin: true},
  %{first_name: "Wrath Of", last_name: "Conn", email: "conn!@example.com", secret: "I cried when Spock died", password: "bestoftimes"},
  %{first_name: "Jonesy", last_name: "McJoneserson", email: "mj@example.com", secret: "I use and shift my plates around in my cupboard so the bottom ones don't feel left out.", password: "password"}
]

for user <- users do
  {:ok, _} = MaySecond.Accounts.create_user(user)
end
