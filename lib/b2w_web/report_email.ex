defmodule B2wWeb.ReportEmail do
  import Swoosh.Email

  def send(file) do
    path = "#{File.cwd!}/#{file.filename}"
    File.cp(file.path, path)
    new()
    |> to({"Luana Aniceto", "lua.aniceto@gmail.com"})
    |> from({"Luana Aniceto", "lua.aniceto@gmail.com"})
    |> subject("CSV - Produtos")
    |> text_body("Em anexo relatório com todos os produtos.\n")
    |> attachment(path)
  end
end