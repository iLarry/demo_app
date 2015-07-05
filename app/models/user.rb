class User < ActiveRecord::Base
  before_save { self.email = email.downcase }

  #name不能为空, 长度不能超过50
  validates :name, presence: true, length: { maximum: 50 }
  #email的匹配规则
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  #email不能为空，长度不能超过255，唯一的不可重复，格式是邮件格式的
  validates :email, presence:true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  #密码最短不能低于5个字符
  validates :password, length: { minimum: 6 }, presence: true

  has_secure_password
end
