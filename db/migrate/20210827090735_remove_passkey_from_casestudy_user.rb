class RemovePasskeyFromCasestudyUser < ActiveRecord::Migration[6.1]
  def change
    remove_column :casestudy_users, :passkey, :string
  end
end
