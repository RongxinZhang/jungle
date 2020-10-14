require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'User' do
    # context "password and password confirmation" do
    #   # it "must match" do
    #   #   user = User.new({password: "123", password_confirmation: "23"})
    #   #   expect(user.save).to be false
    #   # end

    #   it "must match" do
    #     user2 = User.new({password: "234", password_confirmation: "234"})
    #     expect(user2.save).to be true
    #   end
    # end

    context "password must be at least 6 letter" do
      it "must match" do
        user2 = User.new({password: "234"})
        expect(user2.save).to be false
      end

      it "must match" do
        user2 = User.new({password: "1234567"})
        expect(user2.save).to be true
      end

    end
  end

  describe '.authenticate_with_credentials' do
    it "with email and password" do    
      user_info = {id: 3, name: "user1", email: "a@b.com", 
        password: "1234567", password_digest: "$2a$10$kYj6PkJZgkWBpDocXsexA.Ph1NXs8fSQ6lmri/iS737.cI7eNmtBW", 
        created_at: Date.today, updated_at: Date.today}
      demo_user = User.new(user_info)
      puts demo_user.save

      user = User.authenticate_with_credentials(user_info[:email], user_info[:password])
      # puts user
      expect(user).to eq(demo_user)
    end

    it "with email and wrong password to fail" do    
      user_info = {id: 4, name: "user1", email: "c@d.com", 
        password: "1234567", password_digest: "$2a$10$kYj6PkJZgkWBpDocXsexA.Ph1NXs8fSQ6lmri/iS737.cI7eNmtBW", 
        created_at: Date.today, updated_at: Date.today}
      demo_user = User.new(user_info)
      puts demo_user.save

      user = User.authenticate_with_credentials(user_info[:email], "asdfljasdf")
      # puts user
      expect(user).to eq(nil)
    end

    it "remove white spaces" do    
      user_info = {id: 4, name: "user1", email: " c@d.com ", 
        password: "1234567", password_digest: "$2a$10$kYj6PkJZgkWBpDocXsexA.Ph1NXs8fSQ6lmri/iS737.cI7eNmtBW", 
        created_at: Date.today, updated_at: Date.today}
      demo_user = User.new(user_info)
      puts demo_user.save

      user = User.find_by_email("c@d.com")
      # puts user
      expect(user).to eq(demo_user)
    end
  end
end