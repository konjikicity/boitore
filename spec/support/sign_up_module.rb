module SignUpModule
  def sign_up(user)
    visit('/sign-up')
    fill_in 'ユーザー名', with: user.name
    fill_in 'メールアドレス', with: user.email
    fill_in 'パスワード', with: 'password'
    fill_in 'パスワード確認', with: 'password'
    send_keys :return
    click_on '登録'
  end
end