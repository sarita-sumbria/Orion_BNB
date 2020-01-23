require 'spec_helper'
require 'web_helper'

feature 'User sign up' do
  scenario 'allows user to sign up' do
    sign_up
    expect(page).to have_content("Welcome to Orion")
   # expect(User.name).to eq("Testy Testing")
   # expect(User.username).to eq("TestingT")
  end
end