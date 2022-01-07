# frozen_string_literal: true

module Mutations
  module Comments
    class CreateComment < ::Mutations::BaseMutation
      argument :post_id, Int, required: true
      argument :content, String, required: true

      argument :token, String, required: true

      field :comment, CommentType, null: true
      field :errors, [String], null: false

      def resolve(token:, **attributes)
        return { comment: nil, errors: ['No credentials'] } if context[:current_user].blank?

        comment = Comment.new(attributes)
        comment.user = context[:current_user]

        if comment.save
          {
            comment: comment,
            errors: [],
          }
        else
          {
            comment: nil,
            errors: comment.errors.full_messages
          }
        end
      end
    end
  end
end
