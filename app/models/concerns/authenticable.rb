# Interface:
#  attr_reader :username
#  attr_accessor :encrypted_password
#  attr_accessor :salt
module Authenticable
  extend ActiveSupport::Concern

  included do
    attr_accessor :password
    before_save :encrypt_password
    after_save :clear_password
  end

  def authenticate?(login_password)
    challenge = Authentication.new(login_password, salt)
    encrypted_password == challenge.encrypted_password
  end

  private

  def authentication
    @authentication ||= Authentication.new(password, salt)
  end

  def encrypt_password
    if password.present?
      self.salt               = authentication.salt
      self.encrypted_password = authentication.encrypted_password
    end
  end

  def clear_password
    self.password = nil
  end
end
