class CreateCasestudyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :casestudy_users do |t|
      t.references :casestudy, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :assessor, null: false, foreign_key: {to_table: :users}
      t.string :status

      t.timestamps
    end
  end
end
