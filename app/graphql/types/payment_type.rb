# frozen_string_literal: true

module Types
  class PaymentType < BaseObject
    field :subscription, SubscriptionType, null: false
    field :user, UserType, null: false

    field :id, Int, null: false

    field :amount, Float, null: false
    field :aasm_state, String, null: false

    field :completed_at, String, null: true
    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
