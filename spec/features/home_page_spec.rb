feature 'Home page works' do
  scenario " vising home page returns content" do
    visit '/'
    expect(page).to have_content("Welcome to OrionBNB")
  end
end
