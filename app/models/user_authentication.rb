# == Schema Information
#
# Table name: user_authentications
#
#  id                         :integer          not null, primary key
#  user_id                    :integer
#  authentication_provider_id :integer
#  uid                        :string(255)
#  token                      :string(255)
#  token_expires_at           :datetime
#  params                     :text(65535)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class UserAuthentication < ActiveRecord::Base
  belongs_to :user
  belongs_to :authentication_provider

  serialize :params

  def self.create_from_omniauth(params, user, provider)
    auth_provider = AuthenticationProvider.find_by(name: provider)
    create(
      user: user,
      authentication_provider: auth_provider,
      uid: params['user_id'],
      token: params['oauth_token'],
      token_expires_at: 1.month.from_now.to_datetime,
      params: params,
    )
  end
end
