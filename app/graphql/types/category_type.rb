# frozen_string_literal: true

module Types
  class CategoryType < BaseObject
    field :parent_category, CategoryType, null: true
    field :children_categories, [CategoryType, null: true], null: false

    field :title, String, null: false
    field :slug, String, null: false
    field :parent_id, Int, null: false

    field :id, Int, null: false

    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
