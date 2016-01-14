# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string(255)
#  last_name              :string(255)
#  username               :string(255)      not null
#  role                   :integer          default(1), not null
#  email                  :string(255)      not null
#  password_digest        :string(255)
#  token                  :string(255)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :created_at, :current_sign_in_at, :email, :first_name, :id, :last_name,
             :last_sign_in_at, :role, :sign_in_count, :token, :updated_at, :username
end
