# frozen_string_literal: true

module Mutations
  module Users
    class CreateUser < ::Mutations::BaseMutation
      argument :username, String, required: true
      argument :password, String, required: true
      argument :first_name, String, required: false
      argument :last_name, String, required: false
      argument :email, String, required: true

      field :user, Types::UserType, null: true
      field :errors, [String], null: false

      def resolve(username:, password:, first_name:, last_name:, email:)
        user = User.new(
          first_name: first_name,
          last_name: last_name,
          email: email,
          username: username,
          password: password,
        )

        if user.valid?
          user.save!
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
