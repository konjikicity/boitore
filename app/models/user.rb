# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
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
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :play_results, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true
  include DeviseTokenAuth::Concerns::User
end
