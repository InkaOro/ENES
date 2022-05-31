class Subject < ApplicationRecord
  belongs_to :UserSubject
  has_many :topics
end
