# frozen_string_literal: true

class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :trackable, :registerable
  has_many :rent, dependent: :destroy
  has_many :book_suggestion, dependent: :nullify
  validates :first_name, :last_name, presence: true
end
