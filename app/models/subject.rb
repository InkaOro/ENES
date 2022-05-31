class Subject < ApplicationRecord
  # belongs_to :user_subject
  has_many :topics
end
