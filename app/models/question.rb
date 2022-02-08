class Question < ApplicationRecord
  belongs_to :group_question
  has_many :question_options

  accepts_nested_attributes_for :question_options
end