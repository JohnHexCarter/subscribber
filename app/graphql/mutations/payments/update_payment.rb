# frozen_string_literal: true

module Mutations
  module Payments
    class UpdatePayment < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :amount, Float, required: false

      argument :token, String, required: true

      field :payment, Types::PaymentType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { payment: nil, errors: ['No credentials'] } if context[:current_user].blank?

        payment = Payment.find id

        payment.attributes = attributes

        if payment.save
          {
            payment: payment,
            errors: [],
          }
        else
          {
            payment: nil,
            errors: payment.errors.full_messages,
          }
        end
      end
    end
  end
end
