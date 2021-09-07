class AddColumnToCasestudyUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :casestudies, :passkey, :string
  end
end
