# frozen_string_literal: true

module Types
  class MessageType < BaseObject
    field :sender, UserType, null: false
    field :receiver, UserType, null: false

    field :id, Int, null: false

    field :content, String, null: false

    field :seen_at, String, null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
