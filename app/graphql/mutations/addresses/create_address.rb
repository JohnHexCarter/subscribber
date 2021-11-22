# frozen_string_literal: true

module Mutations
  module Addresses
    class CreateAddress < Mutations::BaseMutation
      argument :address_1,    String, required: true
      argument :address_2,    String, required: false
      argument :city,         String, required: true
      argument :province,     String, required: true
      argument :postal_code,  String, required: true
      argument :country,      String, required: true
      argument :user_id,      Int,    required: true
      argument :address_type, String, required: true
      argument :token,        String, required: true

      field :address, Types::AddressType, null: true
      field :errors,  [String],           null: false

      def resolve(user_id:, address_type:, **attributes)
        return { address: nil, errors: ['Not logged in'] } if context[:current_user].blank?

        attributes.delete(:token)

        address = Address.new(attributes)

        if address.save
          user = User.find user_id

          AddressUser.create(
            address: address,
            user: user,
            address_type: address_type,
          )

          {
            address: address,
            errors: [],
          }
        else
          {
            address: nil,
            errors: address.errors.full_message
          }
        end
      end
    end
  end
end
