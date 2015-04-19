class TextForProblems < ActiveRecord::Migration
  def change
    change_table :problems do |t|
      t.change :description, :text
      t.change :solution, :text
    end
  end
end
