defmodule GameReviewsAppWeb.GameController do
  use GameReviewsAppWeb, :controller

  use Appsignal.Instrumentation.Decorators

  alias GameReviewsApp.Games
  alias GameReviewsApp.Games.Game

  action_fallback GameReviewsAppWeb.FallbackController

  # def index(conn, _params) do
  #   games = Games.list_games()
  #   super_slow()
  #   render(conn, :index, games: games)
  # end

  def index(conn, _params) do
    games = Appsignal.instrument("Fetch games", fn ->
      Games.list_games()
    end)

    render(conn, :index, games: games)
  end


  def create(conn, %{"game" => game_params}) do
    with {:ok, %Game{} = game} <- Games.create_game(game_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/games/#{game}")
      |> render(:show, game: game)
    end
  end

  def show(conn, %{"id" => id}) do
    am_i_slow()
    game = Games.get_game_with_reviews(id)
    render(conn, :show, game: game)
  end

  def update(conn, %{"id" => id, "game" => game_params}) do
    game = Games.get_game!(id)

    with {:ok, %Game{} = game} <- Games.update_game(game, game_params) do
      render(conn, :show, game: game)
    end
  end

  def delete(conn, %{"id" => id}) do
    game = Games.get_game!(id)

    with {:ok, %Game{}} <- Games.delete_game(game) do
      send_resp(conn, :no_content, "")
    end
  end

  # @decorate transaction_event()
  # defp super_slow do
  #   :timer.sleep(1000)
  # end

  @decorate transaction_event()
  defp am_i_slow do
    :timer.sleep(1000)
  end
end
