defmodule GameReviewsAppWeb.GameJSON do
  alias GameReviewsApp.Games.Game

  @doc """
  Renders a list of games.
  """
  def index(%{games: games}) do
    %{data: for(game <- games, do: data(game))}
  end

  @doc """
  Renders a single game.
  """
  def show(%{game: game}) do
    %{data: data(game)}
  end

  defp data(%Game{} = game) do
    %{
      id: game.id,
      title: game.title,
      publisher: game.publisher,
      genre: game.genre
    }
  end
end
