class UserSubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject
  validates :subject, uniqueness: { scope: :user }
end
