# frozen_string_literal: true

module Mutations
  module Subscriptions
    class UpdateSubscription < ::Mutations::BaseMutation
      argument :id, Int, required: true
      argument :amount, Float, required: false

      argument :token, String, required: true

      field :subscription, Types::SubscriptionType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { subscription: nil, errors: ['No credentials'] } if context[:current_user].blank?

        subscription = Subscription.find id

        subscription.attributes = attributes

        if subscription.save
          {
            subscription: subscription,
            errors: [],
          }
        else
          {
            subscription: nil,
            errors: subscription.errors.full_messages
          }
        end
      end
    end
  end
end
