# frozen_string_literal: true

module Types
  class PageType < BaseObject
    field :page_users, [PageUserType], null: true
    field :users, [UserType], null: true
    field :pages, [PageType], null: true

    field :id, Int, null: false

    field :title, String, null: false
    field :slug, String, null: false
    field :description, String, null: false

    field :archived_at, String, null: true
    field :created_at, String, null: true
    field :updated_at, String, null: true
  end
end
