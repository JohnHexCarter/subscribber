# frozen_string_literal: true

module Mutations
  module Users
    class UpdateUserPassword < ::Mutations::BaseMutation
      argument :id, Int, required: true
      arguemnt :old_password, String, required: true
      argument :new_password, String, required: true
      argument :confirm_password, String, required: true
      argument :token, String, required: true

      field :user, Types::UserType, null: true
      field :erros, [Types::ErrorReportType, null: true], null: false

      def resolve(id:, old_password:, new_password:, confirm_password:, token:)
        if context[:current_user].blank?
          return {
            user: nil,
            errors: [{field_name: 'all', message: 'no credentials'}]
          } 
        end

        user = User.find id

        errors = []

        if !user.authenticate(old_password)
          errors << {field_name: 'oldPassword', message: 'invalid password'}
        end

        if new_password.blank?
          errors << {field_name: 'newPassword', message: 'cannot be blank'}
        end

        if confirm_password.blank?
          errors << {field_name: 'confirmPassword', message: 'cannot be blank'}
        end

        if new_password != confirm_password && !new_password.blank? && !confirm_password.blank?
          errors << {field_name: 'newPassword', message: 'does not match'}
          errors << {field_name: 'confirmPassword', message: 'does not match'}
        end

        if !errors.empty?
          return {
            user: nil,
            errors: errors,
          }
        end

        user.password = new_password

        if user.save
          {
            user: user,
            errors: [],
          }
        else
          {
            user: nil,
            errors: [{field_name: 'all', message: user.errors.full_messages}]
          }
        end
      end
    end
  end
end
