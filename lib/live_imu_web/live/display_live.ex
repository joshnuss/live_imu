defmodule Live.IMUWeb.DisplayLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <h2 phx-click="boom"><%= inspect @position %></h2>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket) do
      :timer.send_interval(20, self(), :tick)
    end

    {:ok, put_position(socket)}
  end

  def handle_info(:tick, socket) do
    {:noreply, put_position(socket)}
  end

  def handle_event("nav", _path, socket) do
    {:noreply, socket}
  end

  defp put_position(socket) do
    assign(socket, position: Live.IMU.Position.get())
  end
end
