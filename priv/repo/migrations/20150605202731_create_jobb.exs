defmodule Arya.Repo.Migrations.CreateJobb do
  use Ecto.Migration

  def change do
    create table(:jobbs) do
      add :name, :string
      add :repository, :string
      add :playbook, :string
      add :description, :string
      add :users, :integer

      timestamps
    end

  end
end
