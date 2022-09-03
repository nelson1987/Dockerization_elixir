defmodule Wratchil.Teacher do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  schema "tb_teacher" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    timestamps()
  end

  @required_params [:name, :password]
  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  @doc false
  def changeset(params), do: createChangeset(%__MODULE__{}, params)

  def changeset(teacher, params), do: createChangeset(teacher, params)

  defp createChangeset(module_or_teacher, params) do
    module_or_teacher
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:password, min: 6)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset
end
