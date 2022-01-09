defmodule Rumbl.Multimedia.Video do
  @moduledoc """
  Video model
  """

  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type :binary_id

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description])
    |> validate_required([:url, :title, :description])
  end
end
