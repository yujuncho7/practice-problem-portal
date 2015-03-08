class CreateStudent < ActiveRecord::Migration
  def change
    create_table :student do |t|
      t.string :username
      t.string :hashed_password
      t.string :cs_account
    end
  end
end
