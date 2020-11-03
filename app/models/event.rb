class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: {greater_than: 1}
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true
  validate :is_multiple_of_5?
  validate :is_future?

  belongs_to :owner, class_name: "User"
  has_many :attendances, dependent: :destroy
  has_many :guests, through: :attendances, source: :guest

  def is_multiple_of_5?
    duration % 5 == 0
  end

  def is_future?
    start_date.future?
  end

  def end_date
      start_date + duration*60
  end
end
