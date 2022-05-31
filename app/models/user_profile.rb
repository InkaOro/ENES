class UserProfile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :school_name, presence: true
  validates :school_year, presence: true, length: { is: 4 }
  validates :program, inclusion: { in: %w['Sciences & Technologies' 'Social & Human Sciences' 'Socio-Economic Sciences' 'Visual Arts']}
end
