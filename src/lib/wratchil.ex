defmodule Wratchil do
  @moduledoc """
  Wratchil keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  alias Wratchil.Teacher
  defdelegate create_teacher(params), to: Teacher.Create, as: :call
  # defdelegate delete_teacher(params), to: Teacher.Delete, as: :call
  # defdelegate show_teacher(params), to: Teacher.Show, as: :call
  # defdelegate update_teacher(params), to: Teacher.Update, as: :call
end
