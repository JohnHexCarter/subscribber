# frozen_string_literal: true

module Mutations
  module Categories
    class CreateCategory < ::Mutations::BaseMutation
      argument :title, String, required: true
      argument :slug, String, required: true
      argument :parent_id, Int, required: false

      argument :token, String, required: true

      field :category, Types::CategoryType, null: true
      field :errors, [String], null: false

      def resolve(token:, **attributes)
        return { category: nil, errors: ['No credentials'] } if context[:current_user].blank?

        category = Category.new(attributes)

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
