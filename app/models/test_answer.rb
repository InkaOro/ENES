class TestAnswer < ApplicationRecord
  belongs_to :test
  belongs_to :answer
  belongs_to :question
  delegate :content, :correct, to: :answer
end
