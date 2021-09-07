class CreateQuestionTraits < ActiveRecord::Migration[6.1]
  def change
    create_table :question_traits do |t|
      t.references :trait, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
