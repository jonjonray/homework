require 'rails_helper'

describe User do
  subject(:user) do
    FactoryBot.build(:user, email: "fake_email@123.com", password:
      "password")
  end
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }

  it "creates a password_digest when a password is given" do
    expect(user.password_digest).to_not be_nil
  end

  describe "#reset_session_token" do
    it "changes user's session token" do
      old = user.session_token
      user.reset_session_token

      expect(user.session_token).to_not eq(old)
    end
  end

  describe "#is_password?" do
    it "returns true if password input is equal to original" do
      expect(user.is_password?("password")).to eq(true)
    end
  end

  describe "::find_by_credentials" do
    it "return user if correct credentials are provided" do
      user.save!
      expect(User.find_by_credentials("fake_email@123.com","password")).to eq(user)
    end
  end
end

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's email and password" do
        post :create, params: {user: {email: "fake_email@123.com"}}
        expect(response).to render_template('new')
      end
      it "validates that the password is at least 6 characters long" do
        post :create, params: {user: {email: "fake_email@123.com", password: "123"}}
        expect(response).to render_template('new')
      end
    end

    context "with valid params" do
      it "redirects user to bands index on success" do
        post :create, params: {user: {email: "fake_email@123.com", password: "123456"}}
        expect(response).to redirect_to(bands_url)
      end
    end
  end


  feature "the signup process" do


# Couldn't get this part to work for some reason
  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'password', :with => "biscuits"
      click_on "Create User"
    end

    scenario "redirects to bands index page after signup" do
      expect(page).to have_content 'All Bands'
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      click_on "create user"
    end

    scenario "re-renders the signup page after failed signup"
  end

  end

end
