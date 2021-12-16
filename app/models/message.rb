# frozen_string_literal: true

# id            BigInt
# content       String
# sender_id     Int
# recipient_id  Int
# seen_at       DateTime

class Message < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
  belongs_to :recipient, class_name: 'User', foreign_key: 'recipient_id'
end
