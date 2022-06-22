require 'rails_helper'

RSpec.describe "ユーザー登録", type: :system, js:true do
    before { visit('/sign-up') }
    describe '正常なユーザー登録が行えるか確認' do
      context '正常な値を入力した場合' do
        it 'ユーザー登録が成功する' do
        fill_in('ユーザー名', with: Faker::Name.name)
        fill_in('メールアドレス', with: Faker::Internet.email )
        fill_in('パスワード', with: 'password')
        fill_in('パスワード確認', with: 'password')
        send_keys :return
        click_on('登録')
        expect(page).to have_content('モード選択')
        expect(page).to have_content('ユーザー登録が完了しました')
        end
      end
    end

    describe 'フロントのバリデーション確認' do
        describe '必須項目の検証'  do
          context '必須項目が全て未入力の場合' do
            it 'エラーメッセージが表示される' do
              fill_in('ユーザー名', with: '')
              fill_in('メールアドレス', with: '')
              fill_in('パスワード', with: '')
              fill_in('パスワード確認', with: '')
              find('input[id="input-52"]').click
              expect(page).to have_content('ユーザー名を入力してください')
              expect(page).to have_content('メールアドレスを入力してください')
              expect(page).to have_content('パスワードを入力してください')
              expect(page).to have_content('パスワード確認を入力してください')
            end
          end
      end

    describe '文字数の検証' do
      context '50文字以上の名前を入力した場合' do
        it 'エラーメッセージ「50文字以内で入力してください」が表示される' do
          fill_in('ユーザー名', with: Faker::Lorem.characters(number: 51))
          find('input[id="input-58"]').click
          expect(page).to have_content('50文字以内で入力してください')
        end
      end
    end

    describe 'フォーマットの検証' do
      invalid_addresses = %w[user@example,com USER.foo.COM A_US-ER@foo. foo@bar_foo.jp foo@bar+baz.com foo@bar..com foo\ bar@baz.com]
      it 'エラーメッセージ「メールアドレスの形式が正しくありません」が表示される' do
        invalid_addresses.each do |invalid_address|
          fill_in('メールアドレス', with: invalid_address)
          find('input[id="input-58"]').click
          expect(page).to have_content('メールアドレスの形式が正しくありません')
        end
      end
    end
  end
end