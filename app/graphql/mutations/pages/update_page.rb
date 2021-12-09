# frozen_string_literal: true

module Mutations
  module Pages
    class UpdatePage < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :title, String, required: false
      argument :slug, String, required: false
      argument :description, String, required: false
      argument :archived_at, String, required: false
      argument :token, String, required: true

      field :page, Types::PageType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { page: nil, errors: ['No credentials'] } if context[:current_user].blank?

        page = Page.find id
        page.attributes = attributes

        if page.save
          {
            page: page,
            errors: [],
          }
        else
          {
            page: nil,
            errors: page.errors.full_messages,
          }
        end
      end
    end
  end
end
