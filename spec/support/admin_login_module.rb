module AdminLoginModule
  def admin_login(admin)
    visit new_admin_session_path
    fill_in 'Eメール', with: admin.email
    fill_in 'パスワード', with: 'password'
    click_on 'ログイン'
  end
end