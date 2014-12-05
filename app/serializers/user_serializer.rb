class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :username, :role
  # has_many :authentications
end