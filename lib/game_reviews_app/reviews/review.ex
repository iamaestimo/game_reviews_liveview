defmodule GameReviewsApp.Reviews.Review do
  use Ecto.Schema
  import Ecto.Changeset

  schema "reviews" do
    field :review_body, :string
    field :game_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(review, attrs) do
    review
    |> cast(attrs, [:review_body, :game_id])
    |> validate_required([:review_body, :game_id])
  end
end
