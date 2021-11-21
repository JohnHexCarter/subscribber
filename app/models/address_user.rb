# frozen_string_literal: true

# id            BigInt
# address_id    Integer
# user_id       Integer
# address_type  String

class AddressUser < ApplicationRecord
  belongs_to :address
  belongs_to :user
end
