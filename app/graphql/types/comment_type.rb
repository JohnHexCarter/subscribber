# frozen_string_literal: true

module Types
  class CommentType < BaseObject
    field :user, UserType, null: false
    field :post, PostType, null: false
    field :content, String, null: false

    field :id, Int, null: false

    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
