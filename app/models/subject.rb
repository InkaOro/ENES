class Subject < ApplicationRecord
  has_many :topics, dependent: :destroy
  # has_many :user_subjects
end
