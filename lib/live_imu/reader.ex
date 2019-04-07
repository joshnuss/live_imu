defmodule Live.IMU.Reader do
  alias Circuits.UART

  @path "/dev/ttyUSB0"
  @speed 115200
  @wait 500

  def run() do
    pid = spawn_link fn ->
      setup()

      loop()
    end

    {:ok, pid}
  end

  defp setup do
    {:ok, _} = UART.start_link(name: :imu)

    UART.open(:imu, @path, speed: @speed, active: true, framing: Circuits.UART.Framing.Line)
  end

  defp loop do
    receive do
      {:circuits_uart, _path, response} ->
        parse(response)
      t -> IO.inspect(t)
    end

    loop()
  end

  defp parse("!ANG:" <> text) do
    position = text
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&Float.parse/1)
    |> Enum.map(fn {n, _} -> n end)
    |> List.to_tuple()

    Phoenix.PubSub.broadcast(Live.IMU.PubSub, "imu:position", position)
  end

  defp parse(_other), do: nil
end
