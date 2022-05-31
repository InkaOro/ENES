class Question < ApplicationRecord
  belongs_to :topic
  has_many :answers
  has_many :TestQuestions

  validates :type, :main, inclusion: { in: %w[main specific optional]}
end
