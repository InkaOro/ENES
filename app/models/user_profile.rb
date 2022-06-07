class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  SCHOOL_YEAR = ["Year 9", "Year 10", "Year 11", "Year 12"]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :school_name, presence: true
  validates :school_year, presence: true, inclusion: { in: SCHOOL_YEAR }
end
