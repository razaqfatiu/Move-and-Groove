class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         EMAIL_FORMAT = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         validates :email, presence: true, format: { with: EMAIL_FORMAT }, uniqueness: true
       
         before_save {self.email = email.downcase }
         
         has_many :activity_records, dependent: :destroy
end
