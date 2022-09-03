defmodule Wratchil.Teacher.Index do
  alias Wratchil.{Repo, Teacher}

  def call(params) do
    params
    |> Teacher.build()
    |> index_teacher()
  end

  defp index_teacher({:ok, struct}), do: Repo.all(struct)
  defp index_teacher({:error, _changeset} = error), do: error
end
