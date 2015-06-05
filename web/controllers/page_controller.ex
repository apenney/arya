defmodule Arya.PageController do
  use Arya.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
