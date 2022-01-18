# frozen_string_literal: true

module Mutations
  module Notifications
    class UpdateNotification < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :viewed_at, String, required: true

      argument :token, String, required: true

      field :notification, Types::NotificationType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { notification: nil, errors: ['No credentials'] } if context[:current_user].blank?

        notification = Notification.find id
        notification.attributes = attributes

        if notification.save
          {
            notification: notification,
            errors: [],
          }
        else
          {
            notification: nil,
            errors: notification.errors.full_messages,
          }
        end
      end
    end
  end
end
