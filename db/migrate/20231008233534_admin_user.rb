class AdminUser < ActiveRecord::Migration[7.1]
  def up
    admin_user = UserInfo.new(
      username: 'admin', 
      admin: true
    )
    admin_user.password = 'admin1'
    admin_user.password_confirmation = 'admin1'
    admin_user.save
  end

  def down
    admin_user = UserInfo.find_by(username: 'admin')
    admin_user.destroy if admin_user
  end
end
