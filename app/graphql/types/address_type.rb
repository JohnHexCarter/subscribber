# frozen_string_literal: true

module Types
  class AddressType < BaseObject
    field :users, [UserType], null: true
    field :address_users, [AddressUserType], null: true

    field :id, Int, null: false

    field :address_1, String, null: false
    field :address_2, String, null: true
    field :city, String, null: false
    field :province, String, null: false
    field :postal_code, String, null: false
    field :country, String, null: false
  end
end
