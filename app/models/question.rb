class Question < ApplicationRecord
  belongs_to :topic
  has_many :answers
  has_many :test_questions

end
