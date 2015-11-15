# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  first_name             :string
#  last_name              :string
#  username               :string           not null
#  role                   :integer          default(1), not null
#  email                  :string           not null
#  password_digest        :string
#  token                  :string
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :email, :username, :role, :token, :id
end
