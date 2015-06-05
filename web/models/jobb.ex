defmodule Arya.Jobb do
  use Arya.Web, :model

  schema "jobbs" do
    field :name, :string
    field :repository, :string
    field :playbook, :string
    field :description, :string
    field :users, :integer

    timestamps
  end

  @required_fields ~w(name repository playbook description users)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If `params` are nil, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
