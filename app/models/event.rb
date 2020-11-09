class Event < ApplicationRecord
  validates :start_date, presence: true
  validates :duration, presence: true, numericality: {greater_than: 1}
  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
  validates :location, presence: true
  validate :is_multiple_of_5?
  validate :is_future?
  validates :cover, presence: true

  enum status: { pending: 0, accepted: 1, refused: 2 }
  belongs_to :owner, class_name: "User"
  has_many :attendances, dependent: :destroy
  has_many :guests, through: :attendances, source: :guest
  has_one_attached :cover

  def is_multiple_of_5?
    if duration.present?
      duration % 5 == 0
    end
  end

  def is_future?
    if start_date.present?
      start_date.future?
    end
  end

  def end_date
    if start_date.present? && duration.present?
      start_date + duration*60
    end
  end
end
