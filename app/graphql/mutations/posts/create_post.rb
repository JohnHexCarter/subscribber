# frozen_string_literal: true

module Mutations
  module Posts
    class CreatePost < ::Mutations::BaseMutation
      argument :title, String, null: false
      argument :content, String, null: false

      argument :token, String, null: false

      field :post, Types::PostType, null: true
      field :errors, [String], null: false

      def resolve(token:, **attributes)
        return { post: nil, errors: ['No credentials'] } if context[:current_user].blank?

        post = Post.new(attributes)

        if post.save
          {
            post: post,
            errors: [],
          }
        else
          {
            post: nil,
            errors: post.errors.full_messages
          }
        end
      end
    end
  end
end
