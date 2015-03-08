class CreateInstructor < ActiveRecord::Migration
  def change
    create_table :instructor do |t|
      t.string :username
      t.string :hashed_password
    end
  end
end
