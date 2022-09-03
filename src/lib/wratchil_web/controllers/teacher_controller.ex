defmodule WratchilWeb.TeacherController do
  use WratchilWeb, :controller

  def create(conn, params) do
    params
    |> Wratchil.create_teacher()
    |> handle_response(conn)
  end

  defp handle_response({:ok, teacher}, conn) do
    conn
    |> put_status(:ok)
    |> render("create.json", teacher: teacher)
  end

  # def show(conn) do end
  # def delete(conn) do end
  # def update(conn) do end
end
