class User < ActiveRecord::Base
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questions
  has_many :answers

  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true
  # validates :strong_password, :password
  has_secure_password

  # def strong_password(password)
  #   if !password.match?(/^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*\(\)-_])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8,20}$/)
  #     errors.add(:password, 'Password must have 2 uppercase, 3 lowercase, two numbers, one symbol, and be 8 to 20 characters long')
  #   end
  # end
end
