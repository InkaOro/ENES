class Test < ApplicationRecord
  belongs_to :user
  has_many :test_answers
  has_many :test_questions
  has_many :questions, through: :test_questions
end
