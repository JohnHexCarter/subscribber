# frozen_string_literal: true

module Mutations
  module Comments
    class UpdateComment < ::Mutations::BaseMutation
      argument :content, String, required: true

      argument :id, Int, required: true
      argument :token, String, required: true

      field :comment, CommentType, null: true
      field :errors, [String], null: false

      def resolve(id:, token:, **attributes)
        return { comment: nil, errors: ['No credentials'] } if context[:current_user].blank?

        comment = Comment.find id
        comment.attributes = attributes

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
