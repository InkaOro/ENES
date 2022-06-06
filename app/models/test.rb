class Test < ApplicationRecord
  belongs_to :user
  has_many :test_questions
  has_many :test_answers
  has_many :test_questions
  has_many :questions, through: :test_questions

  def correct_answers
    test_answers.count(&:correct)
  end

  def correct_percentage
    (correct_answers.to_f / test_questions.count * 100).round
  end
end
