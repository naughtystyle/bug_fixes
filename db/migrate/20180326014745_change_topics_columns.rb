class ChangeTopicsColumns < ActiveRecord::Migration[5.1]
  def up
    add_reference :topics, :user, foreign_key: true
    change_column :topics, :name, :text
  end

  def down
    change_column :topics, :name, :string
    remove_reference :topics, :user, foreign_key: true
  end
end
