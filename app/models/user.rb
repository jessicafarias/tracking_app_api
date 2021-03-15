class User < ApplicationRecord
  has_many :tasks, class_name: 'Task', foreign_key: 'user_id'
  has_secure_password
  #has_secure_password :recovery_password, validations: false
end
