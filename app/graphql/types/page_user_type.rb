# frozen_string_literal: true

module Types
  class PageUserType < BaseObject
    field :page, PageType, null: false
    field :user, UserType, null: false

    field :id, Int, null: false

    field :role, String, null: false
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
