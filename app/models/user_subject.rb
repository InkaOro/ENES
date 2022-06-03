class UserSubject < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  validates :subject, uniqueness: { scope: :user }
end
