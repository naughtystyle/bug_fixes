class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :message
      t.references :topic, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true

      t.timestamps null: false
    end
  end
end
