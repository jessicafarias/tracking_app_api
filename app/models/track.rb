class Track < ApplicationRecord
  validates :goal, presence: true, numericality: { greater_than: 1, more_than_or_equal_to: :time }
  validates :time, presence: true, numericality: { less_than_or_equal_to: :goal }
  validates :task_id, presence: true

  scope :list_of_dates, -> { select(:expiration_day).distinct }
  belongs_to :task, class_name: 'Task', foreign_key: 'task_id'
end
