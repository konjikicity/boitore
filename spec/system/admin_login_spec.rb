require 'rails_helper'

RSpec.describe "Admins", type: :system do
  let(:admin){ create(:admin) }
  before {
    visit new_admin_session_path
  }

  describe '正常なユーザ-ログインが行えるか確認' do
    context '正常な値を入力した場合' do
      it 'ログインが成功する' do
        fill_in('Eメール', with: admin.email)
        fill_in('パスワード', with: 'password')
        click_on('ログイン')
        expect(page).to have_content('BOIトレ管理画面')
      end
    end
  end

  describe '正常なログアウトが行えるか確認' do
    context 'ログインした状態でログアウトボタンを押す' do
      it 'ログアウトが成功する' do
        admin_login(admin)
        click_on('ログアウト')
        expect(page).to have_content('ログアウトしました。')
      end
    end
  end

  describe 'バリデーションの確認' do
    describe '必須項目の確認' do
      context '必須項目がすべて未入力の場合' do
        it 'エラーメッセージが表示される' do
          fill_in('Eメール', with: '')
          fill_in('パスワード', with: '')
          click_on('ログイン')
          expect(page).to have_content('ログインもしくはアカウント登録してください。')
        end
      end
    end

    describe '新規登録されていないユーザーの確認' do
      context '新規登録されていないユーザーを入力した場合' do
        it 'エラーメッセージが表示される' do
          fill_in('Eメール', with: Faker::Internet.email )
          fill_in('パスワード', with: Faker::Internet.password(min_length:8) )
          click_on('ログイン')
          expect(page).to have_content('Emailまたはパスワードが違います')
        end
      end
    end
  end
end