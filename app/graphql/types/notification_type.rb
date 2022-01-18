# frozen_string_literal: true

module Types
  class NotificationType < BaseObject
    field :user, UserType, null: false
    field :viewed_at, String, null: true
    field :url, String, null: false
    field :content, String, null: false

    field :id, Int, null: false

    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
