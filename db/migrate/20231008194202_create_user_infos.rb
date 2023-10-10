class CreateUserInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :user_infos do |t|
      t.string :username, null: false, index: { unique: true, name: 'unique_usernames' }
      t.string :password_digest, null: false
      t.boolean :admin, default: false
      t.timestamps
    end
  end
end
