# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # Addresses
    field :address, AddressType, null: true do
      description 'Find an address by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def address(id:, **args)
      return if context[:current_user].blank?

      address = Address.find id
    end

    # Messages
    field :message, MessageType, null: true do
      description 'Find a message by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def message(id:, **args)
      return if context[:current_user].blank?

      message = Message.find id # && any restrictions to viewing a message
    end

    # Pages
    field :page, PageType, null: true do
      description 'Find a page by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def page(id:, **args)
      return if context[:current_user].blank?

      page = Page.find id # && any restrictions
    end

    # Posts
    field :post, PostType, null: true do
      description 'Find a post by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def post(id:, **args)
      return if context[:current_user].blank?

      post = Post.find id # && any restrictions
    end

    # Users
    field :user, UserType, null: true do
      description 'Find a user by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def user(id:, **args)
      return if context[:current_user].blank?

      user = User.find id

      if user.present? # && any restrictions to viewing a user
        user
      else
        nil
      end
    end
  end
end
