class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_many :tasks, class_name: 'Task', foreign_key: 'user_id'
  has_secure_password
end
