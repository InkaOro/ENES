class Test < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  has_many :test_questions
  has_many :test_answers
  has_many :test_questions
  has_many :questions, through: :test_questions

  accepts_nested_attributes_for :test_answers
  enum status: { draft: 0, completed: 1 }

  def correct_answers
    test_answers.count(&:correct)
  end

  def correct_percentage
    (correct_answers.to_f / test_questions.count * 100).round
  end
end
