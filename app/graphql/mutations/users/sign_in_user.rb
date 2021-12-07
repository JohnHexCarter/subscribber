# frozen_string_literal: true

module Mutations
  module Users
    class SignInUser < ::Mutations::BaseMutation
      argument :credentials, Types::AuthProviderCredentialsInput, required: false

      field :token, String, null: true
      field :user, Types::UserType, null: true

      field :errors, [Types::ErrorReportType, null: true], null: false

      def resolve(credentials:)
        if credentials.nil?
          return {
            token: nil,
            user: nil,
            errors: [{field_name: 'all', message: 'No credentials'}],
          }
        end

        user = User.find_by(email: credentials[:email])

        if user.blank?
          return {
            token: nil,
            user: nil,
            errors: [{field_name: 'email', message: 'Invalid email'}],
          }
        elsif !user.authenticate(credentials[:password])
          return {
            token: nil,
            user: nil,
            errors: [{field_name: 'password', message: 'Invalid password'}],
          }
        end

        token = AuthToken.token(user)

        {
          token: token,
          user: user,
          errors: [],
        }
      end
    end
  end
end
