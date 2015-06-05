defmodule Arya.JobbView do
  use Arya.Web, :view

  def render("index.json", %{jobbs: jobbs}) do
    %{data: render_many(jobbs, "jobb.json")}
  end

  def render("show.json", %{jobb: jobb}) do
    %{data: render_one(jobb, "jobb.json")}
  end

  def render("jobb.json", %{jobb: jobb}) do
    %{id: jobb.id}
  end
end
