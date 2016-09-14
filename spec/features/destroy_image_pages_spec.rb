require 'rails_helper'

describe 'the delete an image process' do
  it 'deletes an image' do
    user = User.create(:email => "joe@joe.com", :password => "password")
    image = FactoryGirl.create(:image, :user_id => user.id)
    visit new_user_session_path
    fill_in 'Email', :with => 'joe@joe.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_on "delete"
    expect(page).to have_no_content(image.title)
  end
end
