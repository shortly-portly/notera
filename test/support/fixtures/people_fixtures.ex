defmodule Notera.PeopleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Notera.People` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Notera.People.create_person()

    person
  end
end
