class AddDifficultyToProblems < ActiveRecord::Migration
  def change
    add_column :problems, :difficulty, :string
  end
end
