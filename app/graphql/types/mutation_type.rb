# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Addresses
    field :create_address, mutation: Mutations::Addresses::CreateAddress
    field :update_address, mutation: Mutations::Addresses::UpdateAddress
    field :archive_address, mutation: Mutations::Addresses::ArchiveAddress

    # Users
    field :create_user, mutation: Mutations::Users::CreateUser
    field :sign_in_user, mutation: Mutations::Users::SignInUser
    field :sign_out_user, mutation: Mutations::Users::SignOutUser
    field :update_user, mutation: Mutations::Users::UpdateUser
  end
end
