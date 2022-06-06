class TestAnswer < ApplicationRecord
  belongs_to :test
  belongs_to :answer

  delegate :question, :answer_content, :correct, to: :answer
end
