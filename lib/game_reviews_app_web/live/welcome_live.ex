defmodule GameReviewsAppWeb.WelcomeLive do
  use GameReviewsAppWeb, :live_view

  import Appsignal.Phoenix.LiveView, only: [instrument: 4]

  def mount(_params, _session, socket) do
    instrument(__MODULE__, "mount", socket, fn ->
      :timer.send_interval(1000, self(), :tick)
      {
        :ok,
        assign(socket, current_time: DateTime.utc_now())
      }
    end)
  end

  def render(assigns) do
    ~H"""
    <div class="container">
      <h1>Welcome to my LiveView App</h1>
      <p>Current time: <%= @current_time %></p>
    </div>
    """
  end
end
