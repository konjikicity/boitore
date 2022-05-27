require 'rails_helper'

RSpec.describe "Adminの文章のCRUD", type: :system do
  let(:admin){ create(:admin) }
  before {
    admin_login(admin)
  }

  describe '文章新規作成' do
    describe '文章新規作成の確認' do
      context '正常な値を入力した場合' do
        let!(:mode){ create(:mode) }
        it '文章の作成が成功する' do
          visit new_admins_sentence_path
          fill_in('通常の文章', with: 'こんにちは')
          fill_in('母音の文章', with: 'おんいいあ')
          select 'かんたん', from: '難易度'
          click_on('登録する')
          expect(page).to have_content('こんにちは')
          expect(page).to have_content('文章を作成しました')
        end
      end

      context '難易度を変更した場合' do
        let!(:mode){ create(:mode) }
        let!(:mode_normal){ create(:mode, :normal)}
        it '文章の作成が成功する' do
          visit new_admins_sentence_path
          fill_in('通常の文章', with: 'こんにちは')
          fill_in('母音の文章', with: 'おんいいあ')
          select 'ふつう', from: '難易度'
          click_on('登録する')
          expect(page).to have_content('ふつう')
          expect(page).to have_content('文章を作成しました')
        end
      end
    end
  
    describe 'バリデーションの確認' do
      describe '必須項目の確認' do
        context '必須項目がすべて未入力の場合' do
          it 'エラーメッセージが表示される' do
            visit new_admins_sentence_path
            fill_in('通常の文章', with: '')
            fill_in('母音の文章', with: '')
            click_on('登録する')
            expect(page).to have_content('文章を作成できませんでした')
            expect(page).to have_content('通常の文章を入力してください')
            expect(page).to have_content('母音の文章を入力してください')
          end
        end
      end

      describe '文字制限の確認' do
        context '通常の文章を20文字以上で作成した場合' do
          it 'エラーメッセージが表示される' do
          visit new_admins_sentence_path
          fill_in('通常の文章', with: Faker::Lorem.characters(number:21) )
          fill_in('母音の文章', with: 'おんいいあ')
          click_on('登録する')
          expect(page).to have_content('文章を作成できませんでした')
          expect(page).to have_content('通常の文章は20文字以内で入力してください')
          end
        end
        context '母音の文章を20文字以上で作成した場合' do
          it 'エラーメッセージが表示される' do
          visit new_admins_sentence_path
          fill_in('通常の文章', with: 'こんにちは')
          fill_in('母音の文章', with: Faker::Lorem.characters(number:21))
          click_on('登録する')
          expect(page).to have_content('文章を作成できませんでした')
          expect(page).to have_content('母音の文章は20文字以内で入力してください')
          end
        end
      end

      describe '文章の重複の確認' do
        context '作成済みの通常の文章を作成した場合' do
          let(:sentence) { create(:sentence) }
          it 'エラーメッセージが表示される' do
            visit new_admins_sentence_path
            fill_in('通常の文章', with: sentence.normal )
            fill_in('母音の文章', with: 'おんいいあ')
            click_on('登録する')
            expect(page).to have_content('文章を作成できませんでした')
            expect(page).to have_content('通常の文章はすでに存在します')
          end
        end

        context '作成済みの通常の文章を作成した場合' do
          let(:sentence) { create(:sentence) }
          it 'エラーメッセージが表示される' do
            visit new_admins_sentence_path
            fill_in('通常の文章', with: 'こんにちは' )
            fill_in('母音の文章', with: sentence.boin )
            click_on('登録する')
            expect(page).to have_content('文章を作成できませんでした')
            expect(page).to have_content('母音の文章はすでに存在します')
          end
        end
      end
    end
  end

  describe '文章編集' do
    describe '文章編集の確認' do
      context '正常な値を入力した場合' do
        let(:sentence) { create(:sentence) }
        it 'モードの更新が成功する' do
          visit edit_admins_sentence_path(sentence)
          fill_in('通常の文章', with: 'example')
          fill_in('母音の文章', with: 'example')
          click_on('更新する')
          expect(page).to have_content('example')
          expect(page).to have_content('文章を更新しました')
        end
      end
    end


    describe 'バリデーションの確認' do
      describe '必須項目の確認' do
        context '必須項目がすべて未入力の場合' do
          let(:sentence) { create(:sentence) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_sentence_path(sentence)
            fill_in('通常の文章', with: '')
            fill_in('母音の文章', with: '')
            click_on('更新する')
            expect(page).to have_content('文章を更新できませんでした')
            expect(page).to have_content('通常の文章を入力してください')
            expect(page).to have_content('母音の文章を入力してください')
          end
        end
      end

      describe '文字制限の確認' do
        context '通常の文章を20文字以上で作成した場合' do
          let(:sentence) { create(:sentence) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_sentence_path(sentence)
            fill_in('通常の文章', with: Faker::Lorem.characters(number:21) )
            fill_in('母音の文章', with: 'example')
            click_on('更新する')
            expect(page).to have_content('文章を更新できませんでした')
            expect(page).to have_content('通常の文章は20文字以内で入力してください')
          end
        end

        context '母音の文章を20文字以上で作成した場合' do
          let(:sentence) { create(:sentence) }
          it 'エラーメッセージが表示される' do
            visit edit_admins_sentence_path(sentence)
            fill_in('通常の文章', with: 'example' )
            fill_in('母音の文章', with: Faker::Lorem.characters(number:21) )
            click_on('更新する')
            expect(page).to have_content('文章を更新できませんでした')
            expect(page).to have_content('母音の文章は20文字以内で入力してください')
          end
        end
      end

      describe '通常の文章の重複確認' do
        context '作成済みの通常の文章を作成した場合' do
          let(:sentence1) { create(:sentence) }
          let(:sentence2) { create(:sentence, normal: "example", boin: "example") }
          it 'エラーメッセージが表示される' do
            visit edit_admins_sentence_path(sentence2)
            fill_in('通常の文章', with: sentence1.normal )
            fill_in('母音の文章', with: 'example')
            click_on('更新する')
            expect(page).to have_content('文章を更新できませんでした')
            expect(page).to have_content('通常の文章はすでに存在します')
          end
        end

        context '作成済みの母音の文章を作成した場合' do
          let(:sentence1) { create(:sentence) }
          let(:sentence2) { create(:sentence, normal: "example", boin: "example") }
          it 'エラーメッセージが表示される' do
            visit edit_admins_sentence_path(sentence2)
            fill_in('母音の文章', with: sentence1.boin )
            click_on('更新する')
            expect(page).to have_content('文章を更新できませんでした')
            expect(page).to have_content('母音の文章はすでに存在します')
          end
        end
      end
    end  
  end

  describe '文章削除' do
    describe '文章削除の確認' do
      context '削除ボタンを押す' do
        let!(:sentence) { create(:sentence) }
        it '正常に文章が削除される' do
          visit admins_sentences_path
          page.accept_confirm do
            click_on('削除')
          end
          expect(page).to have_content('文章を削除しました')
          expect(page).to_not have_content('こんにちは')
        end
      end
    end
  end
end