defmodule WratchilWeb.TeacherController do
  use WratchilWeb, :controller
  action_fallback WratchilWeb.FallbackController
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
    |> Spi.create_teacher()
    |> handle_response(conn, "create.json", :created)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> Spi.delete_teacher()
    |> handle_delete(conn)
  end

  def show(conn, %{"id" => id}) do
    id
    |> Spi.show_teacher()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> Spi.update_teacher()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_response({:ok, teacher}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, teacher: teacher)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error

  defp handle_delete({:ok, _teacher}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  # defp handle_show({:error, _teacher}, conn) do
  #   conn
  #   |> put_status(:not_found)
  #   |> text("")
  # end
  # defp handle_show({:error, _reason} = error, _conn), do: error

  # GET     /api/v1/teacher           :index
  # GET     /api/v1/teacher/:id       :show
  # POST    /api/v1/teacher           :create
  # PATCH   /api/v1/teacher/:id       :update
  # DELETE  /api/v1/teacher/:id       :delete
end
