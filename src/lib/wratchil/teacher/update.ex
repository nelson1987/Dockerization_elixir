defmodule Wratchil.Teacher.Update do
  alias Wratchil.{Repo, Teacher}

  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error -> {:error, "Invalid id format"}
      {:ok, _uuid} -> update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_teacher(uuid) do
      nil -> {:error, "Teacher not found"}
      teacher -> update_teacher(teacher, params)
    end
  end

  defp fetch_teacher(uuid), do: Repo.get(Teacher, uuid)

  defp update_teacher(teacher, params) do
    teacher
    |> Teacher.changeset(params)
    |> Repo.update()
  end

  defp update_teacher({:error, _changeset} = error), do: error
end
