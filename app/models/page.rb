# frozen_string_literal: true

# id              BigInt
# title           String
# slug            String
# description     Text
# archived_at     DateTime

class Page < ApplicationRecord

  has_many :page_users
  has_many :users, through: :page_users
  has_many :posts

  has_one_attached :avatar
  has_one_attached :banner

end
