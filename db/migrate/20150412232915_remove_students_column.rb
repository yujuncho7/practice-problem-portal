class RemoveStudentsColumn < ActiveRecord::Migration
  def change
    remove_column :students, :email
    remove_column :students, :password_digest
  end
end
