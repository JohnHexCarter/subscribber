# frozen_string_literal: true

module Mutations
  module Pages
    class CreatePage < ::Mutations::BaseMutation
      argument :title, String, required: true
      argument :slug, String, required: true
      argument :description, String, required: true

      argument :token, String, required: true

      field :page, Types::PageType, null: true
      field :errors, [String], null: false

      def resolve(token:, **attributes)
        return { page: nil, errors: ['No credentials'] } if context[:current_user].blank?

        page = Page.new(attributes)

        if page.save
          PageUser.create(page: page, user: context[:current_user], role: 'admin')

          {
            page: page,
            errors: [],
          }
        else
          {
            page: nil,
            errors: page.errors.full_messages
          }
        end
      end
    end
  end
end
