class User < ActiveRecord::Base
    has_secure_password

    # attr_accessor :password, :password_confirmation
    before_validation :strip_whitespace

    validates :password, length: { minimum: 6 }
    
    # validate :check_password_and_password_confirmation

    # def check_password_and_password_confirmation
    #     if :password != :password_confirmation
    #         errors.add(:password, "password and password_confirmation don't match") 
    #     end
    # end

    def strip_whitespace
        self.email = self.email.strip unless self.email.nil?
        self.email = self.email.downcase unless self.email.nil?
    end

    def self.authenticate_with_credentials(email, password)
        user = self.find_by_email(email)
        if (user && user.authenticate(password))
          user
        else
          nil
        end    
    end
end
