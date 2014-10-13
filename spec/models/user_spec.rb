require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "It generates a random nom de plume" do
    it "should equal something" do
      @user = User.create({
        first_name:"Leanna",
        last_name:"Grennan",
        email:"hi@hihihi.com",
        password:"123123123",
        password_confirmation:"123123123",
      })
      expect(@user.nom_de_plume).to match /\w+ \w+/
    end
  end
end
