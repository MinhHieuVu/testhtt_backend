class Category < ApplicationRecord
  has_and_belongs_to_many :tests, join_table: "tests_categories"
  belongs_to :group_category, optional: true
  acts_as_nested_set
end