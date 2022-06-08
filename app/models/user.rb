class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :user_profile
  has_many :user_subjects
  has_many :tests
  has_many :subjects, through: :user_subjects

  # after_create :send_welcome_email

  def test_subjects
    Subject.where(id: tests.completed.pluck(:subject_id).uniq)
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end
end
