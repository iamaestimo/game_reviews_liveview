defmodule GameReviewsApp.Repo do
  # use Ecto.Repo,
  use Appsignal.Ecto.Repo,
    otp_app: :game_reviews_app,
    adapter: Ecto.Adapters.SQLite3
end
