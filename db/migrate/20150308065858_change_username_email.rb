class ChangeUsernameEmail < ActiveRecord::Migration
  def change
    change_table :instructor do |t|
      t.rename :username, :email
    end
    change_table :student do |t|
      t.rename :username, :email
    end
  end
end
