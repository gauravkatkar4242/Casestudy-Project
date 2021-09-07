class DropCasestudyUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :casestudy_users
  end
end
