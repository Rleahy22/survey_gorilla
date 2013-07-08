require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :surveys
  has_many :responses

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.create(params)
    @user = User.new(params)
    @user.password = params[:password]
    @user.save!
    @user
  end

  def self.verify(params)
    @user = User.find_by_username(params[:username])
    puts @user.username
    puts params[:password]
    @user.password == params[:password] ? @user : nil
  end
end
