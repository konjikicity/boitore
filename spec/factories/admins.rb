# == Schema Information
#
# Table name: admins
#
#  id                  :bigint           not null, primary key
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
FactoryBot.define do
  factory :admin do
    email { "example@example.com" }
    password { "password" }
    remember_created_at { "Thu, 26 May 2022 09:58:12.365735000 JST +09:00," }
  end
end
