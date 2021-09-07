class CreateAssessorResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :assessor_responses do |t|

      t.references :question_trait, null: false, foreign_key: true
      t.references :casestudy_user, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :assessor, null: false ,foreign_key: {to_table: :users}

      t.float :rating

      t.timestamps
    end
  end
end
