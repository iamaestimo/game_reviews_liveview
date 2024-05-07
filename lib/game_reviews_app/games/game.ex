defmodule GameReviewsApp.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :title, :string
    field :publisher, :string
    field :genre, :string

    has_many :reviews, GameReviewsApp.Reviews.Review

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(game, attrs) do
    game
    |> cast(attrs, [:title, :publisher, :genre])
    |> validate_required([:title, :publisher, :genre])
  end
end
