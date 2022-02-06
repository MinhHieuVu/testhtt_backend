class GroupQuestion < ApplicationRecord
  belongs_to :test
  has_many :questions, -> { order(:question_number) }


end