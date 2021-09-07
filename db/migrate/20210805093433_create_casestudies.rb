class CreateCasestudies < ActiveRecord::Migration[6.1]
  def change
    create_table :casestudies do |t|
      t.integer :duration
      t.integer :scale

      t.timestamps
    end
  end
end
