class User < ActiveRecord::Base
  after_initialize :default_values
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :questions
  has_many :answers

  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :about_me, length: {maximum: 500}
  validates :username, length: {in: 6..20}
  validates :location, length: {maximum: 40}
  validates :title, length: {maximum: 30}
  validate :strong_password
  has_secure_password

  def strong_password
    if !password.match(/^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*\(\)-_])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8,20}$/)
      errors.add(:password, 'Password must have 2 uppercase, 3 lowercase, two numbers, one symbol, and be 8 to 20 characters long')
    end
  end

  def default_values
    if self.new_record?
      self.username ||= "user#{rand(1000..3000)}"
    end
  end
end
