class ChangeAndAddProblemsColumns < ActiveRecord::Migration
  def change
    add_column :problems, :problem_number, :string
    remove_column :problems, :category
  end
end
