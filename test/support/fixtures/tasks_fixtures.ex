defmodule Notera.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Notera.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Notera.Tasks.create_task()

    task
  end
end
