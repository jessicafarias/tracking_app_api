class DeleteColumnsFromTask < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :time
    remove_column :tasks, :goal
    remove_column :tasks, :progress
  end
end