defmodule B2wWeb.ReportController do
  use B2wWeb, :controller
  alias B2wWeb.ReportEmail
  alias B2wWeb.Mailer

  def send_email(conn, %{"file" => file}) do
    ReportEmail.send(file) 
    |> Mailer.deliver
    render(conn, "index.html")
  end
end