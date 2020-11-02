class Attendance < ApplicationRecord
  belongs_to :event
	belongs_to :guest, class_name: "User"

  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_event(self).deliver_now
  end

end
