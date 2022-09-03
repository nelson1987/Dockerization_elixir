defmodule WratchilWeb.TeacherView do
  use WratchilWeb, :view
  alias Wratchil.Teacher

  def render("create.json", %{teacher: %Teacher{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      message: "Teacher Created",
      teacher: %{
        id: id,
        name: name,
        inserted_at: inserted_at
      }
    }
  end

  def render("show.json", %{teacher: %Teacher{id: id, name: name, inserted_at: inserted_at}}) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at
    }
  end

  def render("update.json", %{
        teacher: %Teacher{id: id, name: name, inserted_at: inserted_at, updated_at: updated_at}
      }) do
    %{
      message: "Teacher Updated",
      teacher: %{
        id: id,
        name: name,
        inserted_at: inserted_at,
        updated_at: updated_at
      }
    }
  end
end
