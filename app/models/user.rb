class User < ActiveRecord::Base
  has_many :colonies, dependent: :destroy
  validates :username, presence: true,
  uniqueness: {case_sensative: false},
  length: {minimum:3, maximum:25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length:{maximum:105},
  uniqueness: {case_sensative: false},
  format: {with: VALID_EMAIL_REGEX}
  before_save{self.email= email.downcase}
  has_secure_password
end
