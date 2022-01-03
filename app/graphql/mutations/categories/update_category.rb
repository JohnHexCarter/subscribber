# frozen_string_literal: true

module Mutations
  module Categories
    class UpdateCategory < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :title, String, required: false
      argument :slug, String, required: false
      argument :parent_id, Int, required: false

      argument :token, String, required: true

      field :category, Types::CategoryType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { category: nil, errors: ['No credentials'] } if context[:current_user].blank?

        category = Category.find id
        category.attributes = attributes

        if category.save
          {
            category: category,
            errors: [],
          }
        else
          {
            category: nil,
            errors: category.errors.full_messages,
          }
        end
      end
    end
  end
end
