class Topic < ApplicationRecord
  belongs_to :subject
  has_many :questions, dependent: :destroy
end
