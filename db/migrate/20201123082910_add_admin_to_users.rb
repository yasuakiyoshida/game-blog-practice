class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin, :boolean, default: false # usersテーブルに管理者(admin)カラム(boolean型)追加、デフォルト値はfalseにしておく
  end
end
