class ChangeDataTypeForStatus < ActiveRecord::Migration[6.1]
  def change
    change_column :casestudy_users, :status,  :integer, :default => 0
    add_column :casestudy_users, :started_time, :datetime
    add_column :casestudy_users, :completed_time, :datetime
    add_column :casestudy_users, :time_elapsed, :integer
  end
end
