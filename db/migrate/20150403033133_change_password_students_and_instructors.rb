class ChangePasswordStudentsAndInstructors < ActiveRecord::Migration
  def change
    remove_column :instructors, :hashed_password
    remove_column :students, :hashed_password
    add_column :students, :password_digest, :string
    add_column :instructors, :password_digest, :string
  end
end
