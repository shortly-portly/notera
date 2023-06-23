defmodule Notera.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :content, :text

      add :project_id, references(:projects)
      add :task_id, references(:tasks)
      add :person_id, references(:people)

      timestamps()
    end
  end
end
