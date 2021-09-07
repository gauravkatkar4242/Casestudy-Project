class CreateUserResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :user_responses do |t|

      t.references :question, null: false, foreign_key: true
      t.references :casestudy_user, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :response


      t.timestamps
    end
  end
end
