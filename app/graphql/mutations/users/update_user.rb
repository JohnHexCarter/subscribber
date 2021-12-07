# frozen_string_literal: true

module Mutations
  module Users
    class UpdateUser < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :email, String, required: false
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :username, String, required: false
      argument :stripe_id, String, required: false
      argument :role, String, required: false
      argument :token, String, required: false

      field :user, Types::UserType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { user: nil, errors: ['No credentials'] } if context[:current_user].blank?

        user = User.find(id)

        if user.update(attributes)
          {
            user: user,
            errors: [],
          }
        else
          {
            user: nil,
            errors: user.errors.full_messages
          }
        end
      end
    end
  end
end
