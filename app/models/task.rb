class Task < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true, numericality: { less_than_or_equal_to: :goal }
  validates :img, presence: true
  validates :goal, presence: true, numericality: { greater_than: 1, more_than_or_equal_to: :time }
  validates  :user_id, presence: true

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  scope :per_week, -> { where("expiration_day<=? AND expiration_day>?", Date.today-7,Date.today-14) }
  scope :today, -> { where(expiration_day: Date.today)}
  scope :yesterday, -> {where(expiration_day: Date.today-1)}
  scope :date, ->(date) { where("expiration_day=?", Date.parse(date)) }
  scope :list_of_dates, -> {select(:expiration_day).distinct}
end
