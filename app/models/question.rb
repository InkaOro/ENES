class Question < ApplicationRecord
  belongs_to :subject
  has_many :answers
  has_many :test_questions
end
