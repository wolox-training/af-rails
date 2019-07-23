# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :trackable, :validatable
  has_many :rent, dependent: :destroy
  devise :database_authenticatable, :registerable
  has_many :rent, dependent: :destroy
  validates :first_name, :last_name, presence: true
end
