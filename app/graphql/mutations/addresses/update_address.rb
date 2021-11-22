# frozen_string_literal: true

module Mutations
  module Addresses
    class UpdateAddress < Mutations::BaseMutation
      argument :id,          Int,    required: true
      argument :address_1,   String, required: false
      argument :address_2,   String, required: false
      argument :city,        String, required: false
      argument :province,    String, required: false
      argument :postal_code, String, required: false
      argument :country,     String, required: false
      argument :token,       String, required: true

      field :address, Types::AddressType, null: true
      field :errors,  [String],           null: false

      def resolve(id:, **attributes)
        return { address: nil, errors: ['Not logged in'] } if context[:current_user].blank?

        address = Address.find id

        if address.update(attributes)
          {
            address: address,
            errors: [],
          }
        else
          {
            address: nil,
            errors: address.errors.full_message,
          }
        end
      end
    end
  end
end
