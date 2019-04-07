defmodule Live.IMUWeb.DisplayLive do
  use Phoenix.LiveView

  import :math, only: [ cos: 1, sin: 1 ]

  def render(assigns) do
    {roll, pitch, yaw} = assigns.position

    ~L"""
    <div>
      <ul>
        <li>pitch: <%= pitch %></li>
        <li>roll: <%= roll %></li>
        <li>yaw: <%= yaw %></li>
      </ul>

    <div id="line" style="transform: rotateZ(<%= yaw %>deg) rotateX(<%= pitch %>deg) rotateY(<%= roll %>deg)"></div>
    </div>
    """
  end

  def mount(_session, socket) do
    Phoenix.PubSub.subscribe(Live.IMU.PubSub, "imu:position")

    {:ok, put_position(socket)}
  end

  def handle_info(position={_, _, _}, socket) do
    {:noreply, put_position(socket, position)}
  end

  def handle_event("nav", _path, socket) do
    {:noreply, socket}
  end

  defp put_position(socket, position \\ {0,0,0}) do
    assign(socket, position: position)
  end
end
