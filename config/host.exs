import Config

config :tft_example, :viewport,
size: {480, 320},
theme: :dark,
default_scene: TftExample.Scene.Home,
drivers: [
[
    module: Scenic.Driver.Local,
    window: [title: "throwaway_nerves_scenic_app"],
    on_close: :stop_system
]
]


# Add configuration that is only needed when running on the host here.
