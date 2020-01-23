feature 'Create a booking' do
  scenario '' do

    connection = PG.connect(dbname: 'orion_bnb_test')

    visit '/'
    fill_in 'booked', with 'true'
    click_button 'Submit'

    expect(page).to

  end
end