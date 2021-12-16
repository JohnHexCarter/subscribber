# frozen_string_literal: true

module Mutations
  module Messages
    class UpdateMessage < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :content, String, required: false
      argument :seen_at, String, required: false

      argument :token, String, required: true

      field :message, Types::MessageType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
      return { message: nil, errors: ['No credentials'] } if context[:current_user].blank?

      message = Message.find id
      message.attributes = attributes

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
