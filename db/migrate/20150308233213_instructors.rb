class Instructors < ActiveRecord::Migration
  def change
    create_table :instructors
    add_column :instructors, :email, :string
    add_column :instructors, :hashed_password, :string
  end
end
