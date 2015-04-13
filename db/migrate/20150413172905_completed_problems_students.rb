class CompletedProblemsStudents < ActiveRecord::Migration
  def change
    add_column :students, :completed_problems, :text
  end
end
