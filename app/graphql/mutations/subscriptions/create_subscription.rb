# frozen_string_literal: true

module Mutations
  module Subscriptions
    class CreateSubscription < ::Mutations::BaseMutation
      argument :page_id, Int, required: true
      argument :amount, Float, required: true

      argument :token, String, required: true

      field :subscription, Types::SubscriptionType, null: true
      field :errors, [String], null: false

      def resolve(token: **attributes)
        return { subscription: nil, errors: ['No credentials'] } if context[:current_user].blank?

        subscription = Subscription.new(attributes)

        subscription.user = context[:current_user]

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
