defmodule Wratchil.Teacher.Show do
  alias Wratchil.{Repo, Teacher}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid id format"}
      {:ok, uuid} -> get_teacher(uuid)
    end
  end

  defp get_teacher(uuid) do
    case Repo.get(Teacher, uuid) do
      nil -> {:error, "Teacher not found"}
      teacher -> {:ok, teacher}
    end
  end
end
