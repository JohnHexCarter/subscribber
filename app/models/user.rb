# frozen_string_literal: true

# email       String
# first_name  String
# last_name   String
# username    String
# stripe_id   String
# role        String
# archived_at DateTime

class User < ApplicationRecord
  # has_many addresses

  ROLE_LIST = %w[user creator admin].freeze

  validates :role, inclusion: { in: ROLE_LIST }
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  def self.allowable_roles
    ROLE_LIST
  end

end
