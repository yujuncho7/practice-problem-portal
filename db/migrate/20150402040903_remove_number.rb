class RemoveNumber < ActiveRecord::Migration
  def change
    remove_column :problems, :problem_number
  end
end
