# frozen_string_literal: true

module Types
  class UserType < BaseObject
    field :addresses, [AddressType], null: true
    field :address_users, [AddressUserType], null: true

    field :id, Int, null: false

    field :username, String, null: false
    field :email, String, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :stripe_id, String, null: true
    field :role, String, null: false
  end
end