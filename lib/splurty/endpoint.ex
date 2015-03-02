defmodule Smsx.Endpoint do
  use Phoenix.Endpoint, otp_app: :Smsx

  plug Plug.Static,
    at: "/", from: :Smsx

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_Smsx_key",
    signing_salt: "99UlQRv8",
    encryption_salt: "qPsBTi3A"

  plug :router, Smsx.Router
end
