# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string           not null
#  encrypted_password :string           default(""), not null
#  image              :string
#  name               :string(50)       not null
#  nickname           :string(50)
#  provider           :string           default("email"), not null
#  tokens             :json
#  uid                :string           default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_uid_and_provider  (uid,provider) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "必須項目のバリデーション確認" do
    context "全カラムの値を指定しているとき" do
      let(:user) { create(:user) }

      it "userのレコードが作成される" do
        expect(user).to be_valid
      end
    end

    context "emailを指定していないとき" do
      let(:user) { build(:user, email: nil) }

      it "エラーになる" do
        user.valid?
        expect(user.errors.messages[:email]).to include "を入力してください"
      end
    end

    context "passwordを指定していないとき" do
      let(:user) { build(:user, password: nil) }

      it "エラーになる" do
        user.valid?
        expect(user.errors.messages[:password]).to include "を入力してください"
      end
    end
  end

  describe "重複のバリデーション確認" do
    context "保存されたメールアドレスが指定されたとき" do
      let(:user1) { create(:user) }
      let(:user2) { build(:user, email: user1.email) }

      it "エラーになる" do
        user2.valid?
        expect(user2.errors.messages[:email]).to include "はすでに存在します"
      end
    end
  end

  describe "文字制限のバリデーション確認" do
    context "名前が50文字以上だった場合" do
      let(:user) { build(:user, name: Faker::Lorem.characters(number:51) )}

      it "エラーになる" do
        user.valid?
        expect(user.errors.messages[:name]).to include "は50文字以内で入力してください"
      end
    end

    context "nicknameが50文字以上だった場合" do
      let(:user) { build(:user, nickname: Faker::Lorem.characters(number:51) )}
      
      it "エラーになる" do
        user.valid?
        expect(user.errors.messages[:nickname]).to include "は50文字以内で入力してください"
      end
    end
  end
end
