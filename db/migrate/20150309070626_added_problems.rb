class AddedProblems < ActiveRecord::Migration
  def change
    create_table :problems
    add_column :problems, :title, :string
    add_column :problems, :description, :string
    add_column :problems, :category, :string
  end
end
