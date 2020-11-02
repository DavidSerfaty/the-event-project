class User < ApplicationRecord
  has_many :events, foreign_key: 'owner_id', dependent: :destroy
  has_many :attendances, foreign_key: 'guest_id'
  has_many :attended_events, through: :attendances, source: :event

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
