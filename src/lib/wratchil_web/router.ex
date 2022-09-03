defmodule WratchilWeb.Router do
  use WratchilWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WratchilWeb do
    pipe_through :api
    resources "/v1/teacher", TeacherController
    # post "/v1/teacher", TeacherController, :create
    # get "/v1/teacher", TeacherController, :show
    # delete "/v1/teacher", TeacherController, :delete
    # head "/v1/teacher", TeacherController, :update
  end


  scope "/api/swagger" do
    forward "/", PhoenixSwagger.Plug.SwaggerUI, otp_app: :wratchil, swagger_file: "swagger.json"
  end

  def swagger_info do
    %{
      schemes: ["http", "https", "ws", "wss"],
      info: %{
        version: "1.0",
        title: "Minha Primeira Api no Swagger usando Elixir.",
        description: "API feita em Elixir com Swagger"
      },
      consumes: ["application/json"],
      produces: ["application/json"]
    }
  end
  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: WratchilWeb.Telemetry
    end
  end
end
