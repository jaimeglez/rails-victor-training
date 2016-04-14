class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :articles, dependent: :destroy
  validates :username, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, length: { minimum: 8 }, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: " email incorrect" }, presence: true , confirmation: true
  validates :email_confirmation, presence: true
  validates :password, numericality: { only_integer: true }, length: { minimum: 8 }, presence: true
end
