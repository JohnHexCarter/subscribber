# frozen_string_literal: true

# id           BigInt
# aasm_state   String, default: 'pending'
# amount       Float, default: 0.00
# user_id      Int
# page_id      Int

class Subscription < ApplicationRecord
  include AASM

  belongs_to :user
  belongs_to :page

  aasm do
    state :pending, initial: true
    state :active, :inactive

    event :activate do
      transitions from: :pending, to: :active
    end

    event :pend do
      transitions from [:active, :inactive], to: :pending
    end

    event :deactivate do
      transitions from [:active, :pending], to: :inactive
    end
  end

end
