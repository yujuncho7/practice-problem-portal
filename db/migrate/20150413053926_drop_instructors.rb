class DropInstructors < ActiveRecord::Migration
  def change
    remove_column :instructors, :email
    remove_column :instructors, :password_digest
  end
end
