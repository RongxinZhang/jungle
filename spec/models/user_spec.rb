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
end