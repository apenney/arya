defmodule Arya.JobControllerTest do
  use Arya.ConnCase

  alias Arya.Job
  @valid_attrs %{description: "some content", name: "some content", playbook: "some content", repository: "some content", users: 42}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, job_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    job = Repo.insert %Job{}
    conn = get conn, job_path(conn, :show, job)
    assert json_response(conn, 200)["data"] == %{
      "id" => job.id
    }
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, job_path(conn, :create), job: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Job, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, job_path(conn, :create), job: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    job = Repo.insert %Job{}
    conn = put conn, job_path(conn, :update, job), job: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Job, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    job = Repo.insert %Job{}
    conn = put conn, job_path(conn, :update, job), job: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    job = Repo.insert %Job{}
    conn = delete conn, job_path(conn, :delete, job)
    assert json_response(conn, 200)["data"]["id"]
    refute Repo.get(Job, job.id)
  end
end
