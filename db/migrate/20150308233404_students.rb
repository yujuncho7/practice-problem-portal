class Students < ActiveRecord::Migration
  def change
    create_table :students
    add_column :students, :cs_account, :string
    add_column :students, :email, :string
    add_column :students, :hashed_password, :string
  end
end
