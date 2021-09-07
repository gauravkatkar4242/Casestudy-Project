class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.references :casestudy, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
