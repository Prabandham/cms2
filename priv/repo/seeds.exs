# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cms2.Repo.insert!(%Cms2.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Cms2.Db.CmsAdmin
alias Cms2.Repo

user_map = %{name: "Srinidhi", email: "srinidhi@larks.in", password: "password"}
%CmsAdmin{}
|> CmsAdmin.changeset(user_map)
|> Repo.insert!