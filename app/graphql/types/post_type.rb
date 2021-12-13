# frozen_string_literal: true

module Types
  class PostType < BaseObject
    field :pages, [PageType], null: true

    field :id, Int, null: false

    field :title, String, null: false
    field :content, String, null: false

    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
