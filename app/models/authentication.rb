class Authentication
  attr_reader :encrypted_password, :salt

  def initialize(password, salt = nil)
    @password = password
    @salt = salt
    encrypt_password
  end

  private

  def encrypt_password
    if @password.present?
      @salt ||= BCrypt::Engine.generate_salt
      @encrypted_password = BCrypt::Engine.hash_secret(@password, @salt)
    end
  end
end
