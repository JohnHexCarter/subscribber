# frozen_string_literal: true

module Mutations
  module Posts
    class UpdatePost < ::Mutations::BaseMutation
      argument :id, Int, null: false
      argument :title, String, null: true
      argument :content, String, null: true

      argument :token, String, null: false

      field :post, Types::PostType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { post: nil, errors: ['No credentials'] } if context[:current_user].blank?

        post = Post.find id
        post.attributes = attributes

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
