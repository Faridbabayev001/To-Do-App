class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks

  has_many :user_tasks , :foreign_key => :user_id

  scope :find_user_by_username_or_email, ->(name) {where("username=? OR email=?", name,name)  }

end
