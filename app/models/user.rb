# frozen_string_literal: true

# email       String
# password    Encrypted
# first_name  String
# last_name   String
# username    String
# stripe_id   String
# role        String
# archived_at DateTime

class User < ApplicationRecord
  has_secure_password

  has_many :address_users
  has_many :addresses, through: :address_users
  has_many :page_users
  has_many :pages, through: :page_users

  ROLE_LIST = %w[user creator admin].freeze

  validates :role, inclusion: { in: ROLE_LIST }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true

  def self.allowable_roles
    ROLE_LIST
  end

end
