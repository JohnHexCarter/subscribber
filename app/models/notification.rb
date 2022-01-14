# frozen_string_literal: true

# id            BigInt
# user_id       Int
# viewed_at     DateTime
# url           String
# content       String

class Notification < ApplicationRecord
  belongs_to :user
end
