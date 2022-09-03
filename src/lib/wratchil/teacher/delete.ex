defmodule Wratchil.Teacher.Delete do
  alias Wratchil.{Repo, Teacher}

  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, "Invalid id format"}
      {:ok, uuid} -> delete_teacher(uuid)
    end
  end

  defp delete_teacher(uuid) do
    case fetch_teacher(uuid) do
      nil -> {:error, "Teacher not found"}
      teacher -> Repo.delete(teacher)
    end
  end

  defp fetch_teacher(uuid), do: Repo.get(Teacher, uuid)
  # defp delete_teacher(struct), do: Repo.delete(struct)
  # defp delete_teacher({:error, changeset} = error), do: error
end
