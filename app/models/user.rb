class User < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questions
  has_many :answers

  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true
  # validates :strong_password
  # validates :password, length: { minimum: 8 }
  has_secure_password

  # def strong_password
  #
  # end
end
