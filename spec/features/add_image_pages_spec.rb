require 'rails_helper'

describe "the add an image process" do
  it "adds a new image" do
    new_user = User.create(email: 'joe@joe.com', password: 'password')
    visit new_user_session_path
    fill_in 'Email', :with => 'joe@joe.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_link 'Add an image'
    fill_in 'Title', :with => 'Something'
    fill_in 'Url', :with => 'Something else'
    fill_in 'Tags', :with => "a, b, c"
    click_on 'Create Image'
    expect(page).to have_content 'Something'
  end

  it "gives error when no information is entered" do
    new_user = User.create(email: 'joe@joe.com', password: 'password')
    visit new_user_session_path
    fill_in 'Email', :with => 'joe@joe.com'
    fill_in 'Password', :with => 'password'
    click_on 'Log in'
    click_link 'Add an image'
    click_on 'Create Image'
    expect(page).to have_content 'Please fix these errors:'
  end
end
