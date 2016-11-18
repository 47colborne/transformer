defmodule Transformer.PageController do
  use Transformer.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
