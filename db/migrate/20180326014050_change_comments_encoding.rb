class ChangeCommentsEncoding < ActiveRecord::Migration[5.1]
  def up
    execute "ALTER TABLE comments CONVERT TO CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
    execute "ALTER TABLE comments MODIFY message VARCHAR(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin"
  end

  def down
    execute "ALTER TABLE comments CONVERT TO CHARACTER SET utf8 COLLATE utf8_bin"
    execute "ALTER TABLE comments MODIFY message VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_bin"
  end
end
