# frozen_string_literal: true

# id           BigInt
# address_1    String
# address_2    String
# city         String
# province     String
# postal_code  String
# country      String
# archived_at  DateTime

class Address < ApplicationRecord

  has_many :address_users
  has_many :users, through: :address_users

  validates :address_1, presence: true
  validates :city, presence: true
  validates :province, presence: true
  validates :postal_code, presence: true
  validates :country, presence: true

end
