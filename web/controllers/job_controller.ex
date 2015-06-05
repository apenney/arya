defmodule Arya.JobController do
  use Arya.Web, :controller

  alias Arya.Job

  plug :scrub_params, "job" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    jobs = Repo.all(Job)
    render(conn, "index.json", jobs: jobs)
  end

  def create(conn, %{"job" => job_params}) do
    changeset = Job.changeset(%Job{}, job_params)

    if changeset.valid? do
      job = Repo.insert(changeset)
      render(conn, "show.json", job: job)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Arya.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    job = Repo.get(Job, id)
    render conn, "show.json", job: job
  end

  def update(conn, %{"id" => id, "job" => job_params}) do
    job = Repo.get(Job, id)
    changeset = Job.changeset(job, job_params)

    if changeset.valid? do
      job = Repo.update(changeset)
      render(conn, "show.json", job: job)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Arya.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    job = Repo.get(Job, id)

    job = Repo.delete(job)
    render(conn, "show.json", job: job)
  end
end
