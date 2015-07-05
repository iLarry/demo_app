require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  # #setup会在每个测试方法运行前执行
  def setup
    @user = User.new(name: "test", email: "test@gmail.com", password:"test1111", password_confirmation: "test1111")
  end

  test "should be valid" do
    #如果通过验证会返回true，那就通过测试，
    assert @user.valid?
  end

  #name不能为空测试
  test "name should be present" do
    @user.name = "     "
    assert_not @user.valid?
  end

  #email不能为空测试
  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  #name长度过长测试
  test "name should not be too long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  #email长度过长测试
  test "email should not be too long" do
    @user.email = "a" * 255 + "@gmail.com"
    assert_not @user.valid?
  end

  #测试邮件的有效性
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  # email唯一性测试
  test "email address should be unique" do
    duplicate_user = @user.dup
    # duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  #密码长度测试
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    # assert_not @user.valid?
    assert_not @user.valid?
  end

end
