defmodule GameReviewsApp.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add :title, :string
      add :publisher, :string
      add :genre, :string

      timestamps(type: :utc_datetime)
    end
  end
end
