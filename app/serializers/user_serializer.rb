class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :username, :role, :token, :id
  # has_many :authentications
end