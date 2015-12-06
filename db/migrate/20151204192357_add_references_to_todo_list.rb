class AddReferencesToTodoList < ActiveRecord::Migration
  def change
    add_reference :todo_lists, :user, index: true
  end
end
