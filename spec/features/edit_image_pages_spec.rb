
require 'rails_helper'

describe 'the edit an image process' do
  it 'edits an image' do
    user = User.create(:email => "joe@joe.com", :password => "password")
    image = FactoryGirl.create(:image, :user_id => user.id)
    visit edit_image_path(image)
    fill_in "Title", :with => "Something else"
    click_on "Update Image"
    expect(page).to have_content "Something else"
  end

  it "gives an error if a field is blank" do
    user = User.create(:email => "joe@joe.com", :password => "password")
    image = FactoryGirl.create(:image, :user_id => user.id)
    visit edit_image_path(image)
    fill_in "Title", :with => ""
    click_on "Update Image"
    expect(page).to have_content 'errors'
  end
end
