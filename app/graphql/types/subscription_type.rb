# frozen_string_literal: true

module Types
  class SubscriptionType < BaseObject
    field :user, UserType, null: false
    field :page, PageType, null: false

    field :id, Int, null: false

    field :aasm_state, String, null: false
    field :amount, Float, null: false

    field :created_at, String, null: false
    field :updated_at, String, null: false
  end
end
