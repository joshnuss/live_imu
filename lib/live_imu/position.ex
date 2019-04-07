defmodule Live.IMU.Position do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, {0, 0, 0}, name: __MODULE__)
  end

  def init(arg) do
    Phoenix.PubSub.subscribe(Live.IMU.PubSub, "imu:position")

    {:ok, arg}
  end

  def handle_call(:position, _from, position) do
    {:reply, position, position}
  end

  def handle_info(position = {_x, _y, _z}, _old) do
    {:noreply, position}
  end

  def get do
    GenServer.call(__MODULE__, :position)
  end
end
