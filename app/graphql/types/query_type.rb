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

      Address.find id
    end

    # Categories
    field :category, CategoryType, null: true do
      description 'Find a category by ID'

      argument :id, Int, required: true
      argument :token, String, requried: true
    end

    field :all_categories, [CategoryType], null: false do
      description 'Find all categories'

      argument :token, String, required: true
    end

    def category(id:, **args)
      return if context[:current_user].blank?

      Category.find id
    end

    def all_categories(**args)
      return [] if context[:current_user].blank?

      Category.all
    end

    # Comments
    field :comment, CommentType, null: true do
      description 'Find a comment by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def comment(id:, **args)
      return if context[:current_user].blank?

      Comment.find id
    end

    # Messages
    field :message, MessageType, null: true do
      description 'Find a message by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def message(id:, **args)
      return if context[:current_user].blank?

      Message.find id # && any restrictions to viewing a message
    end

    # Pages
    field :page, PageType, null: true do
      description 'Find a page by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def page(id:, **args)
      return if context[:current_user].blank?

      Page.find id # && any restrictions
    end

    # Payments
    field :payment, PaymentType, null: true do
      description 'Find a payment by ID'

      argument :id, Int, required: true
      argument :token, String, required: true  
    end

    def payment(id: **args)
      return if context[:current_user].blank?

      Payment.find id # && any restrictions
    end

    # Posts
    field :post, PostType, null: true do
      description 'Find a post by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def post(id:, **args)
      return if context[:current_user].blank?

      Post.find id # && any restrictions
    end

    # Subscriptions
    field :subscription, SubscriptionType, null: true do
      description 'Find a subscription by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def subscription(id:, **args)
      return if context[:current_user].blank/

      Subscription.find id # && any restrictions
    end

    # Users
    field :user, UserType, null: true do
      description 'Find a user by ID'

      argument :id, Int, required: true
      argument :token, String, required: true
    end

    def user(id:, **args)
      return if context[:current_user].blank?

      u = User.find id

      if u.present? # && any restrictions to viewing a user
        u
      else
        nil
      end
    end
  end
end
