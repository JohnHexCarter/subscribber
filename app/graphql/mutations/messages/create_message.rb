# frozen_string_literal: true

module Mutations
  module Messages
    class CreateMessage < ::Mutations::BaseMutation
      argument :recipient_id, Int, required: true
      argument :content, String, required: true

      argument :token, String, required: true

      field :message, Types::MessageType, null: true
      field :errors, [String], null: false

      def resolve(token:, recipient_id:, content:)
      return { message: nil, errors: ['No credentials'] } if context[:current_user].blank?

      message = Message.new(
        sender: context[:current_user],
        recipient_id: recipient_id,
        content: content,
      )

      if message.save
        {
          message: message,
          errors: [],
        }
      else
        {
          message: nil,
          errors: message.errors.full_messages,
        }
      end
    end
  end
end
