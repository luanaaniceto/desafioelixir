defmodule B2w.Repo do
  use Ecto.Repo, otp_app: :b2w, adapter: Mongo.Ecto
  
  def url, do: "ecto://mongo:mongo@localhost:27017"
end
