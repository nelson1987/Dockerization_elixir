defmodule WratchilWeb.FallbackController do
  use WratchilWeb, :controller

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(WratchilWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
