class AddNicknameFromUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, after: :id
  end
end
