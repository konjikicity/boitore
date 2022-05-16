module LoginModule
  def login(user)
    visit('/login')
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'password'
    click_on 'ログイン'
  end
end