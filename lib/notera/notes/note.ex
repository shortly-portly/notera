defmodule Notera.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :content, :string

    belongs_to :project, Notera.Projects.Project
    belongs_to :task, Notera.Tasks.Task
    belongs_to :person, Notera.People.Person

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:content])
    |> validate_required([:content])
  end
end
