defmodule GameReviewsApp.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GameReviewsApp.Games` context.
  """

  @doc """
  Generate a game.
  """
  def game_fixture(attrs \\ %{}) do
    {:ok, game} =
      attrs
      |> Enum.into(%{
        genre: "some genre",
        publisher: "some publisher",
        title: "some title"
      })
      |> GameReviewsApp.Games.create_game()

    game
  end
end
