# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    # Addresses
    field :create_address, mutation: Mutations::Addresses::CreateAddress
    field :update_address, mutation: Mutations::Addresses::UpdateAddress

    # Messages
    field :create_message, mutation: Mutations::Messages::CreateMessage
    field :update_message, mutation: Mutations::Messages::UpdateMessage

    # Pages
    field :create_page, mutation: Mutations::Pages::CreatePage
    field :update_page, mutation: Mutations::Pages::UpdatePage

    # PageUsers
    field :create_page_user, mutation: Mutations::PageUsers::CreatePageUser
    field :update_page_user, mutation: Mutations::PageUsers::UpdatePageUser

    # Posts
    field :create_post, mutation: Mutation::Posts::CreatePost
    field :update_post, mutation: Mutation::Posts::UpdatePost

    # Subscriptions
    field :create_subscription, mutation: Mutation::Subscriptions::CreateSubscription
    field :update_subscription, mutation: Mutation::Subscriptions::UpdateSubscription

    # Users
    field :create_user, mutation: Mutations::Users::CreateUser
    field :sign_in_user, mutation: Mutations::Users::SignInUser
    field :update_user, mutation: Mutations::Users::UpdateUser
    field :update_user_password, mutation: Mutations::Users::UpdateUserPassword
  end
end
