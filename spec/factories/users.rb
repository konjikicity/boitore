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
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    nickname { Faker::Name.name }
    sequence(:email) { |n| "#{n}_" + Faker::Internet.email }
    password { 'password' }
  end
end
