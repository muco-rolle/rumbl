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

    belongs_to :user, Rumbl.Accounts.User
    belongs_to :category, Rumbl.Multimedia.Category

    timestamps()
  end

  @doc false
  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :title, :description, :category_id])
    |> validate_required([:url, :title, :description])
  end
end
