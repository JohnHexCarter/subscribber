# frozen_string_literal: true

module Mutations
  module PageUsers
    class CreatePageUsers < ::Mutations::BaseMutation
      argument :page_id, Int, required: true
      argument :user_id, Int, required: true
      arguemnt :role, String, required: true
      argument :token, String, required: true

      field :page_user, Types::PageUserType, null: true
      field :errors, [String], null: false

      def resolve(token:, **attributes)
        return { page_user: nil, errors: ['No credentials'] } if context[:current_user].blank?

        pu = PageUser.new(attributes)

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
