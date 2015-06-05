defmodule Arya.JobTest do
  use Arya.ModelCase

  alias Arya.Job

  @valid_attrs %{description: "some content", name: "some content", playbook: "some content", repository: "some content", users: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Job.changeset(%Job{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Job.changeset(%Job{}, @invalid_attrs)
    refute changeset.valid?
  end
end
