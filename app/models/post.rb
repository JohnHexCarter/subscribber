# frozen_string_literal: true

# id              BigInt
# title           String
# content         Text
# page_id         Int

class Post < ApplicationRecord
  belongs_to :page
end
