class User
  include Mongoid::Document
  include Authenticable

  field :username, type: String
  field :encrypted_password, type: String
  field :salt, type: String
end
