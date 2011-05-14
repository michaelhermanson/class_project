class User < ActiveRecord::Base
attr_readonly :name
  attr_reader   :password
  attr_accessor :password_confirmation

  validates_presence_of   :name
  validates_length_of     :name, :within => 1..40
  validates_uniqueness_of :name

  validates_length_of     :motto, :within => 0..80

  validates_confirmation_of :password

  def password=(pword)
    @password = pword.strip
    return if @password.length < 6 || @password.length > 40
    self.salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{rand.to_s}--")
    self.salted_password = User.encrypted_password(self.salt, @password)
  end

  def validate_on_create
    if @password.length < 6 || @password.length > 40
      errors.add(:password, "must have between 6 and 40 characters")
    end
  end

  def self.authenticate(name, password)
    user = find(:first, :conditions => [ "name = ?", name ])
    if user
      if user.salted_password != encrypted_password(user.salt, password)
        user = nil
      end
    end
    user
  end

  private
    def self.encrypted_password(salt, password)
      Digest::SHA1.hexdigest("--#{salt}--#{password}--")
    end
end

