class User < ApplicationRecord
  has_many :tasks, class_name: 'Task', foreign_key: 'user_id'
end
