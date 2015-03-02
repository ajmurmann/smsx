defmodule Splurty.SMSController do
  use Phoenix.Controller

  plug :action

  def create(conn, _params) do
    HTTPotion.start

    token = System.get_env["TWILIO_TOKEN"]
    account = System.get_env["TWILIO_ACCOUNT"]
    response = HTTPotion.post(
         ~s|https://#{account}:#{token}@api.twilio.com/2010-04-01/Accounts/#{account}/Messages.json|,
         [
          body: "Body=HelloFromTheApp&To=+16502831933&From=+16502657294",
          headers: ["User-Agent": "My App", "Content-Type": "application/x-www-form-urlencoded"]
         ]
    )
    conn
    |> assign(:response, response)
    |> render("send.html")
  end
end