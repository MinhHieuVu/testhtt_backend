class Question < ApplicationRecord
  belongs_to :group_question
  has_many :question_options

  accepts_nested_attributes_for :question_options
  enum question_type: { single_choice: 0, multiple_choice: 1, matching: 2, complete: 3 }
end