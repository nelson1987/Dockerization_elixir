defmodule WratchilWeb.TeacherController do
  use WratchilWeb, :controller

  use PhoenixSwagger
  alias WratchilWeb.SwaggerDefinitions

  SwaggerDefinitions.swagger_definitions()

  swagger_path(:create) do
    post("/api/v1/teacher")
    description("List all users in the database")
    response(200, "OK", Schema.ref(:UsersResponse))
    parameter(:user, :body, Schema.ref(:UserRequest), "user Request")
  end

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
