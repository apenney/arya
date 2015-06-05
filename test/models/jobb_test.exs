defmodule Arya.JobbTest do
  use Arya.ModelCase

  alias Arya.Jobb

  @valid_attrs %{description: "some content", name: "some content", playbook: "some content", repository: "some content", users: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Jobb.changeset(%Jobb{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Jobb.changeset(%Jobb{}, @invalid_attrs)
    refute changeset.valid?
  end
end
