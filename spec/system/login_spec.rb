require 'rails_helper'

RSpec.describe "ユーザーログイン", type: :system, js:true do
  let(:user){ create(:user) }
  before {
  sign_up(user)
  visit('/login')
  }
  describe '正常なユーザ-ログインが行えるか確認' do
    context '正常な値を入力した場合' do
      it 'ログインが成功する' do
        fill_in('メールアドレス', with: user.email)
        fill_in('パスワード', with: 'password')
        send_keys :return
        within "#login" do
          click_on('ログイン')
        end
        expect(page).to have_content('モード選択')
        expect(page).to have_content('ログインしました')
      end
    end
  end

  describe 'バリデーションの確認' do
    describe '必須項目の確認' do
      context '必須項目がすべて未入力の場合' do
        it 'エラーメッセージが表示される' do
          fill_in('メールアドレス', with: '')
          fill_in('パスワード', with: '')
          send_keys :return
          expect(page).to have_content('メールアドレスを入力してください')
          expect(page).to have_content('パスワードを入力してください')
        end
      end
    end

    describe '新規登録されていないユーザーの確認' do
      context '新規登録されていないユーザーを入力した場合' do
        it 'エラーメッセージが表示される' do
          fill_in('メールアドレス', with: Faker::Internet.email )
          fill_in('パスワード', with: Faker::Internet.password(min_length:8) )
          send_keys :return
          within "#login" do
            click_on('ログイン')
          end
          expect(page).to have_content('メールアドレスまたはパスワードが違います')
        end
      end
    end
  end
end