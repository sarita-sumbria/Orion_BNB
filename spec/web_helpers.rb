def sign_up
  visit ('/')
  click_link('Sign Up')
  fill_in :name, with: 'Testy Testing'
  fill_in :username, with: 'TestingT'
  fill_in :email, with: 'testy@oriontest.com'
  fill_in :password, with: 'obnbtest'
  click_button('Sign Up')
end