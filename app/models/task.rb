class Task < ApplicationRecord
  validates :name, presence: true
  validates :time, presence: true
  validates :img, presence: true
  validates :goal, presence: true
  validates  :user_id, presence: true
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  scope :per_week, -> { where("expiration_day<=? AND expiration_day>?", Date.today-7,Date.today-14) }

end
