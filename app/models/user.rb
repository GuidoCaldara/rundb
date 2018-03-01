class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_many :orders
  has_many :races, through: :orders
  has_many :favorites
  has_many :reviews

  has_one :organisation

end
