class Task < ApplicationRecord
  validates :name, presence: true
  validates :img, presence: true
  validates :user_id, presence: true
  validates :expiration_day, presence: true
  has_many :tracks, dependent: :destroy

  scope :with_track, lambda {
                       select('tracks.id AS id, tracks.time, tracks.goal,
                       tasks.name, tracks.day AS expiration_day,
                       tasks.img, tracks.progress')
                         .joins(:tracks)
                     }

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  scope :per_week, -> { where('expiration_day<=? AND expiration_day>?', Date.today - 7, Date.today - 14) }
  scope :today, -> { joins(:tracks).where('tracks.day = ?', Date.today) }
  scope :yesterday, -> { joins(:tracks).where('tracks.day = ?', Date.today - 1) }
  scope :date, ->(date) { joins(:tracks).where('tracks.day = ?', Date.parse(date)) }
  scope :expiration_dates, -> { select(:expiration_day).distinct }
  scope :list_of_dates, lambda {
    joins(:tracks).select('tracks.day AS expiration_day').order('tracks.day ASC').distinct
  }
end
