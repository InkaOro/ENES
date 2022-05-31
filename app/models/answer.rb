class Answer < ApplicationRecord
  belongs_to :question
  has_many :test_answers
end
