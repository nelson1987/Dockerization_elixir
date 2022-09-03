defmodule Wratchil.Teacher.Create do
  alias Wratchil.{Repo, Teacher}

  def call(params) do
    params
    |> Teacher.build()
    |> create_teacher()
  end

  defp create_teacher({:ok, struct}), do: Repo.insert(struct)
  defp create_teacher({:error, changeset} = error), do: error
end
