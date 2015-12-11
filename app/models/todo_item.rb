class TodoItem < ActiveRecord::Base

  def self.count_todo_items
    TodoItem.where(completed: true).count
  end
end
