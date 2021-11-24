# frozen_string_literal: true

module Mutations
  module Addresses
    class ArchiveAddress < Mutations::BaseMutation
      argument :id, Int, required: true
      argument :token, String, required: true

      field :address, Types::AddressType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:)
        return { address: nil, errors: ['Not logged in'] } if context[:current_user].blank?

        address = Address.find id

        address.update(archived_at: Time.now)

        {
          address: address,
          errors: []
        }
      end
    end
  end
end
