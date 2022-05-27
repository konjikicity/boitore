require 'rails_helper'

RSpec.describe "AdminのモードCRUD", type: :system do
  let(:admin){ create(:admin) }
  before {
    admin_login(admin)
  }

  describe 'モード新規作成' do
    describe 'モード新規作成の確認' do
      context '正常な値を入力した場合' do
        it 'モードの作成が成功する' do
          visit new_admins_mode_path
          fill_in('難易度', with: 'example')
          fill_in('説明', with: 'example')
          click_on('登録する')
          expect(page).to have_content('example')
          expect(page).to have_content('モードを作成しました')
        end
      end
    end
  
    describe 'バリデーションの確認' do
      describe '必須項目の確認' do
        context '必須項目がすべて未入力の場合' do
          it 'エラーメッセージが表示される' do
            visit new_admins_mode_path
            fill_in('難易度', with: '')
            fill_in('説明', with: '')
            click_on('登録する')
            expect(page).to have_content('モードを作成できませんでした')
            expect(page).to have_content('難易度を入力してください')
            expect(page).to have_content('説明を入力してください')
          end
        end
      end

      describe '文字制限の確認' do
        context '難易度を10文字以上で作成した場合' do
          it 'エラーメッセージが表示される' do
          visit new_admins_mode_path
          fill_in('難易度', with: Faker::Lorem.characters(number:11) )
          fill_in('説明', with: 'example')
          click_on('登録する')
          expect(page).to have_content('モードを作成できませんでした')
          expect(page).to have_content('難易度は10文字以内で入力してください')
        end
      end
    end

      describe '難易度の重複の確認' do
        context '作成済みの難易度を作成した場合' do
          let(:mode) { create(:mode) }
          it 'エラーメッセージが表示される' do
            visit new_admins_mode_path
            fill_in('難易度', with: mode.difficulty )
            fill_in('説明', with: 'example')
            click_on('登録する')
            expect(page).to have_content('モードを作成できませんでした')
            expect(page).to have_content('難易度はすでに存在します')
          end
        end
      end
    end
  end

  describe 'モード編集' do
    describe 'モード編集の確認' do
      context '正常な値を入力した場合' do
        let(:mode) { create(:mode) }
        it 'モードの更新が成功する' do
          visit edit_admins_mode_path(mode)
          fill_in('難易度', with: 'example')
          fill_in('説明', with: 'example')
          click_on('更新する')
          expect(page).to have_content('example')
          expect(page).to have_content('モードを更新しました')
        end
      end
    end


    describe 'バリデーションの確認' do
      describe '必須項目の確認' do
        context '必須項目がすべて未入力の場合' do
          let(:mode) { create(:mode) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_mode_path(mode)
            fill_in('難易度', with: '')
            fill_in('説明', with: '')
            click_on('更新する')
            expect(page).to have_content('モードを更新できませんでした')
            expect(page).to have_content('難易度を入力してください')
            expect(page).to have_content('説明を入力してください')
          end
        end
      end

      describe '文字制限の確認' do
        context '難易度を10文字以上で作成した場合' do
          let(:mode) { create(:mode) }
          it 'エラーメッセージが表示される' do
          visit edit_admins_mode_path(mode)
          fill_in('難易度', with: Faker::Lorem.characters(number:11) )
          fill_in('説明', with: 'example')
          click_on('更新する')
          expect(page).to have_content('モードを更新できませんでした')
          expect(page).to have_content('難易度は10文字以内で入力してください')
        end
      end
    end

      describe '難易度の重複の確認' do
        context '作成済みの難易度を作成した場合' do
          let(:mode1) { create(:mode) }
          let(:mode2) { create(:mode, difficulty: "example", description: "example") }
          it 'エラーメッセージが表示される' do
            visit edit_admins_mode_path(mode2)
            fill_in('難易度', with: mode1.difficulty )
            fill_in('説明', with: 'example')
            click_on('更新する')
            expect(page).to have_content('モードを更新できませんでした')
            expect(page).to have_content('難易度はすでに存在します')
          end
        end
      end
    end  
  end

  describe 'モード削除' do
    describe 'モード削除の確認' do
      context '削除ボタンを押す' do
        let!(:mode) { create(:mode) }
        it '正常にモードが削除される' do
          visit admins_modes_path
          page.accept_confirm do
            click_on('削除')
          end
          expect(page).to have_content('モードを削除しました')
          expect(page).to_not have_content('こんにちは')
        end
      end
    end
  end
end