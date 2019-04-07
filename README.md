# Live.IMU


Demo of [Phoenix LiveView](https://github.com/phoenixframework/phoenix_live_view) moving IMU data around. Uses an ESP32 dev board to acquire and clean the data from the sensor and transfer it via USB.

## Parts

- [Pololu IMU](https://www.pololu.com/product/2739/pictures)
- [ESP32 Devkit](https://docs.espressif.com/projects/esp-idf/en/latest/get-started/get-started-devkitc.html)

![Circuit](https://github.com/joshnuss/live_imu/raw/master/circuit.jpg)

# Development

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
