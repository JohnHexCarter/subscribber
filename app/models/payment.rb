# frozen_string_literal: true

# id            BigInt
# amount        Float
# aasm_state    String
# completed_at  DateTime

class Payment < ApplicationRecord
  include AASM

  belongs_to :subscription
  has_one :user, through: :subscription

  aasm do
    state :initiated, initial: true
    state :void, :completed, :pending, :processing, :failure

    event :voided do
      transitions from: [:initiated, :pending, :completed], to: :void
    end

    event :complete do
      before do
        self.update(completed_at: Time.zone.now)
      end

      transitions from: [:initiated, :processing], to: :completed
    end

    event :pend do
      transitions from: [:initiated, :processing], to: :pending
    end

    event :process do
      transitions from: [:initiated, :pending], to: :processing
    end

    event :fail do
      transitions from: :processing to: :failure
    end
  end
end
