# == Schema Information
#
# Table name: admins
#
#  id                  :integer          not null, primary key
#  email               :string           default(""), not null
#  encrypted_password  :string           default(""), not null
#  remember_created_at :datetime
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_admins_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe Admin, type: :model do
  
  describe '必須項目のバリデーション確認' do
    context '全カラムの値を指定しているとき' do
      let(:admin) { create(:admin) }

      it 'adminのレコードが作成される' do
        expect(admin).to be_valid
      end
    end

    context 'emailカラムを指定していないとき' do
      let(:admin) { build(:admin, email: nil) }

      it 'エラーになる' do
        admin.valid?
        expect(admin.errors.messages[:email]).to include "を入力してください"
      end
    end

    context 'passwordカラムを指定していないとき' do
      let(:admin) { build(:admin, password: nil) }

      it 'エラーになる' do
        admin.valid?
        expect(admin.errors.messages[:password]).to include "を入力してください"
      end
    end
  end

  describe "重複のバリデーション確認" do
    context "保存されたemailカラムと重複しているとき" do
      let(:admin1) { create(:admin) }
      let(:admin2) { build(:admin, email: admin1.email) }

      it "エラーになる" do
        admin2.valid?
        expect(admin2.errors.messages[:email]).to include "はすでに存在します"
      end
    end
  end
end
