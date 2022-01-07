# frozen_string_literal: true

# id            BigInt
# user_id       Int
# post_id       Int
# content       String

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

end
