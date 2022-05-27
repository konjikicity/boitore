require 'rails_helper'

RSpec.describe "AdminのUserCRUD", type: :system do
  let(:admin){ create(:admin) }
  before {
    admin_login(admin)
  }

  describe 'ユーザー新規作成' do
    describe 'ユーザー新規作成の確認' do
      context '正常な値を入力した場合' do
        it 'ユーザーの作成が成功する' do
          visit new_admins_user_path
          fill_in('名前', with: 'onoda')
          fill_in('メールアドレス', with: 'example@example.com')
          fill_in('パスワード', with: 'password')
          fill_in('パスワード確認', with:'password')
          click_on('登録する')
          expect(page).to have_content('onoda')
          expect(page).to have_content('ユーザーを作成しました')
        end
      end
    end
  
    describe 'バリデーションの確認' do
      describe '必須項目の確認' do
        context '必須項目がすべて未入力の場合' do
          it 'エラーメッセージが表示される' do
            visit new_admins_user_path
            fill_in('名前', with: '')
            fill_in('メールアドレス', with: '')
            fill_in('パスワード', with: '')
            fill_in('パスワード確認', with: '')
            click_on('登録する')
            expect(page).to have_content('ユーザーを作成できませんでした')
            expect(page).to have_content('名前を入力してください')
            expect(page).to have_content('メールアドレスを入力してください')
            expect(page).to have_content('パスワードを入力してください')
          end
        end
      end

      describe '文字制限の確認' do
        context '名前を10文字以上で作成した場合' do
          it 'エラーメッセージが表示される' do
            visit new_admins_user_path
            fill_in('名前', with: Faker::Lorem.characters(number:11) )
            fill_in('メールアドレス', with: 'example@example.com')
            fill_in('パスワード', with: 'password')
            fill_in('パスワード確認', with: 'password')
            click_on('登録する')
            expect(page).to have_content('ユーザーを作成できませんでした')
            expect(page).to have_content('名前は10文字以内で入力してください')
        end
      end
    end

      describe '重複の確認' do
        context '作成済みの名前で作成した場合' do
          let(:user) { create(:user) }
          it 'エラーメッセージが表示される' do
            visit new_admins_user_path
            fill_in('名前', with: user.name )
            fill_in('メールアドレス', with: 'example@example.com')
            fill_in('パスワード', with: 'password')
            fill_in('パスワード確認', with: 'password')
            click_on('登録する')
            expect(page).to have_content('ユーザーを作成できませんでした')
            expect(page).to have_content('名前はすでに存在します')
          end
        end

        context '作成済みのメールアドレスで作成した場合' do
          let(:user) { create(:user) }
          it 'エラーメッセージが表示される' do
            visit new_admins_user_path
            fill_in('名前', with: 'sonoda' )
            fill_in('メールアドレス', with: user.email )
            fill_in('パスワード', with: 'password')
            fill_in('パスワード確認', with: 'password')
            click_on('登録する')
            expect(page).to have_content('ユーザーを作成できませんでした')
            expect(page).to have_content('メールアドレスはすでに存在します')
          end
        end
      end
      describe 'フォーマットの検証' do
        context 'フォーマットが正しくないメールアドレスを作成した場合' do
          invalid_addresses = %w[user@example,com USER.foo.COM A_US-ER@foo. foo@bar_foo.jp foo@bar+baz.com foo@bar..com foo\ bar@baz.com]
          it 'エラーメッセージが表示される' do
            invalid_addresses.each do |invalid_address|
              visit new_admins_user_path
              fill_in('名前', with: 'onoda')
              fill_in('メールアドレス', with: invalid_address)
              fill_in('パスワード', with: 'password')
              fill_in('パスワード確認', with:'password')
              click_on('登録する')
              expect(page).to have_content('メールアドレスは有効ではありません')
            end
          end
        end
      end
    end
  end

  describe 'ユーザー編集' do
    describe 'ユーザー編集の確認' do
      context '正常な値を入力した場合' do
        let(:user) { create(:user) }
        it 'ユーザーの更新が成功する' do
          visit edit_admins_user_path(user)
          fill_in('名前', with: 'onoda')
          fill_in('メールアドレス', with: 'example@example.com')
          click_on('更新する')
          expect(page).to have_content('onoda')
          expect(page).to have_content('ユーザーを更新しました')
        end
      end
    end


    describe 'バリデーションの確認' do
      describe '必須項目の確認' do
        context '必須項目がすべて未入力の場合' do
          let(:user) { create(:user) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_user_path(user)
            fill_in('名前', with: '')
            fill_in('メールアドレス', with: '')
            click_on('更新する')
            expect(page).to have_content('ユーザーを更新できませんでした')
            expect(page).to have_content('名前を入力してください')
            expect(page).to have_content('メールアドレスを入力してください')
          end
        end
      end

      describe '文字制限の確認' do
        context '名前を10文字以上で作成した場合' do
          let(:user) { create(:user) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_user_path(user)
            fill_in('名前', with: Faker::Lorem.characters(number:11) )
            fill_in('メールアドレス', with: 'example@example.com')
            click_on('更新する')
            expect(page).to have_content('ユーザーを更新できませんでした')
            expect(page).to have_content('名前は10文字以内で入力してください')
          end
        end
      end

      describe '重複の確認' do
        context '作成済みの名前で作成した場合' do
          let(:user1) { create(:user) }
          let(:user2) { create(:user) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_user_path(user2)
            fill_in('名前', with: user1.name )
            click_on('更新する')
            expect(page).to have_content('ユーザーを更新できませんでした')
            expect(page).to have_content('名前はすでに存在します')
          end
        end

        context '作成済みのメールアドレスで作成した場合' do
          let(:user1) { create(:user) }
          let(:user2) { create(:user) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_user_path(user2)
            fill_in('メールアドレス', with: user1.email )
            click_on('更新する')
            expect(page).to have_content('ユーザーを更新できませんでした')
            expect(page).to have_content('メールアドレスはすでに存在します')
          end
        end
      end
    end  
  end

  describe 'ユーザー削除' do
    describe 'ユーザー削除の確認' do
      context '削除ボタンを押す' do
        let!(:user) { create(:user) }
        it '正常にモードが削除される' do
          visit admins_users_path
          page.accept_confirm do
            click_on('削除')
          end
          expect(page).to have_content('ユーザーを削除しました')
          expect(page).to_not have_content(user.name)
        end
      end
    end
  end
end