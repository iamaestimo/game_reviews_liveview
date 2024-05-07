defmodule GameReviewsApp.ReviewsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GameReviewsApp.Reviews` context.
  """

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        review_body: "some review_body"
      })
      |> GameReviewsApp.Reviews.create_review()

    review
  end
end
