defmodule WratchilWeb.TeacherController do
  use WratchilWeb, :controller

  use PhoenixSwagger

  swagger_path :index do
    get("/posts")
    description("List blog posts")

    parameters do
      tracker(:body, Schema.ref(:UserRequest), "Activity to record", required: true)
    end

    response(404, "Not found", Schema.ref(:NotFoundError))

    response(200, "Success", Schema.ref(:UsersResponse),
      example: %{
        data: [
          %{
            id: 1,
            count: 42,
            email: "some email",
            name: "some name",
            private: true,
            profile: "some profile"
          }
        ]
      }
    )
  end

  def index(conn, _params) do
    posts = Repo.all(Post)
    render(conn, "index.json", posts: posts)
  end

  def swagger_definitions do
    %{
      User:
        swagger_schema do
          title("Pessoa")
          description("A user of the app")

          properties do
            id(:integer, "User ID")
            name(:string, "User name", required: true)
            email(:string, "Email address", format: :email, required: true)
            inserted_at(:string, "Creation timestamp", format: :datetime)
            updated_at(:string, "Update timestamp", format: :datetime)
          end

          example(%{
            id: 123,
            name: "Joe",
            email: "joe@gmail.com"
          })
        end,
      UserRequest:
        swagger_schema do
          title("UserRequest")
          description("POST body for creating a user")
          property(:user, Schema.ref(:User), "The user details")
        end,
      UserResponse:
        swagger_schema do
          title("UserResponse")
          description("Response schema for single user")
          property(:data, Schema.ref(:User), "The user details")
        end,
      UsersResponse:
        swagger_schema do
          title("UsersReponse")
          description("Response schema for multiple users")
          property(:data, Schema.array(:User), "The users details")
        end,
      NotFoundError:
        swagger_schema do
          title("NotFound")
          description("Response schema for Not Found users")
          #property(:data, "Não encontrado", "The users details")
        end
    }
  end
end
