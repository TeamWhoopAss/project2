require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "validation" do

    before(:context) do
      @first_params = {
        email: "Mark@MarkIsTheRockingestRocker.com",
        email_confirmation: "Mark@MarkIsTheRockingestRocker.com",
        password: "RockandRollman",
        password_confirmation: "RockandRollman",
      }
      @first_user = User.create(@first_params)
end

before(:example) do
  @valid_params = {
        email: "Mark@MarkKicksTheFunkyBeats.com",
        email_confirmation: "Mark@MarkKicksTheFunkyBeats",
        password: "AllThoseFunkyBeats",
        password_confirmation: "AllThoseFunkyBeats"
  }

end

after(:example) do
  User.last.destroy()
end

describe "email" do

  it "should be unique" do
    user = User.new(@first_params)

    expect(user.save).to be(false)

    user = User.create(@valid_params)

    is_updated = user.update_attributes(@first_params)

    expect(is_updated).to be(false)

    user.destroy()
  end

  describe "create" do

    it "should be present" do
      @valid_params[:email_confirmation] = nil
      user = User.new(@valid_params)

      expect(user.save).to be(false)
    end

    it "should be confirmed" do
      @valid_params[:email_confirmation] = "notMatching"
      user = User.new(@valid_params)

      expect(user.save).to be(false)
    end

    it "should enforce persence of email_confirmation" do
      @valid_params[:email_confirmation]
