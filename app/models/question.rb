class Question < ApplicationRecord
  belongs_to :topic
  has_many :answers
  has_many :test_questions

  validates :question_type, inclusion: { in: %w[main specific optional]}
end
