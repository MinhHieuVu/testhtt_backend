class Test < ApplicationRecord
  has_rich_text :description
  has_many :group_questions
  has_and_belongs_to_many :categories, join_table: "tests_categories"

end