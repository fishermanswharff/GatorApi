class User < ActiveRecord::Base
  before_validation :set_token
  after_create :udpate_remember_created_at

  has_many :user_authentications, dependent: :destroy
  has_many :userfeeds
  has_many :feeds, through: :userfeeds

  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :password, :password_confirmation, presence: true, on: :create
  validates :token, length: { is: 32 }, on: :create
  validates :email,
            format: {
              with: /(?:[\w\d\S]+)@(?:[\w\d\-\.]){1,253}[\.](?:[\w]{2,4})/,
              message: 'That’s not a real email address, dummy.'
            }

  enum role: [:admin,:generic]
  has_secure_password

  def increment_sign_in_count
    self.sign_in_count += 1
    self.save!
  end

  def reset_password
    self.reset_password_token = generate_token
    self.save!
  end

  def update_reset_password_ts
    self.reset_password_sent_at = generate_timestamp
    self.save!
  end

  def set_current_sign_in
    self.current_sign_in_at = generate_timestamp
    self.save!
  end

  def set_last_sign_in
    self.last_sign_in_at = self.current_sign_in_at
    self.save!
  end

  private

  def udpate_remember_created_at
    self.remember_created_at = generate_timestamp
    self.save!
  end

  def set_token
    return if token.present?
    self.token = generate_token
  end

  def generate_token
    SecureRandom.uuid.gsub(/\-/,'')
  end

  def generate_timestamp
    DateTime.now
  end

end
