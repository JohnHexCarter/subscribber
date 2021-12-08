# frozen_string_literal: true

# id            BigInt
# page_id       Integer
# user_id       Integer
# role          String

class PageUser < ApplicationRecord
  belongs_to :page
  belongs_to :user
end
