defmodule Arya.JobbController do
  use Arya.Web, :controller

  alias Arya.Jobb

  plug :scrub_params, "jobb" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    jobbs = Repo.all(Jobb)
    render(conn, "index.json", jobbs: jobbs)
  end

  def create(conn, %{"jobb" => jobb_params}) do
    changeset = Jobb.changeset(%Jobb{}, jobb_params)

    if changeset.valid? do
      jobb = Repo.insert(changeset)
      render(conn, "show.json", jobb: jobb)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Arya.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    jobb = Repo.get(Jobb, id)
    render conn, "show.json", jobb: jobb
  end

  def update(conn, %{"id" => id, "jobb" => jobb_params}) do
    jobb = Repo.get(Jobb, id)
    changeset = Jobb.changeset(jobb, jobb_params)

    if changeset.valid? do
      jobb = Repo.update(changeset)
      render(conn, "show.json", jobb: jobb)
    else
      conn
      |> put_status(:unprocessable_entity)
      |> render(Arya.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    jobb = Repo.get(Jobb, id)

    jobb = Repo.delete(jobb)
    render(conn, "show.json", jobb: jobb)
  end
end
