# frozen_string_literal: true

module Mutations
  module PageUsers
    class UpdatePageUsers < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :role, String, required: false
      argument :token, String, required: true

      field :page_user, Types::PageUserType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { page_user: nil, errors: ['No credentials'] } if context[:current_user].blank?

        pu = PageUser.find id

        pu.attributes = attributes

        if pu.save
          {
            page_user: pu,
            errors: [],
          }
        else
          {
            page_user: nil,
            errors: pu.errors.full_messages,
          }
        end
      end
    end
  end
end
