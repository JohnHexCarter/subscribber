# frozen_string_literal: true

module Mutations
  module Payments
    class CreatePayment < ::Mutations::BaseMutation
      argument :amount, Float, required: true
      argument :subscription_id, Int, required: true

      argument :token, String, required: true

      field :payment, Types::PaymentType, null: true
      field :errors, [String], null: false

      def resolve(token:, **attributes)
        return { payment: nil, errors: ['No credentials'] } if context[:current_user].blank?

        payment = Payment.new(attributes)

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
