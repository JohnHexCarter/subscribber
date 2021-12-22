# frozen_string_literal: true

# id         BigInt
# title      String
# slug       String
# parent_id  Int

class Category < ApplicationRecord
  belongs_to :parent_category, class_name: 'Category', foreign_key: 'parent_id', optional: true

  has_many :children_categories, class_name: 'Category', foreign_key: 'parent_id'

end
