require 'rails_helper'

describe 'As a logged in user' do
  before(:each) do
    mod_1_tutorial_data = {
      "title"=>"Back End Engineering - Module 1",
      "description"=>"Videos related to Mod 1.",
      "thumbnail"=>"https://i.ytimg.com/vi/tZDBWXZzLPk/hqdefault.jpg",
      "playlist_id"=>"PL1Y67f0xPzdNsXqiJs1s4NlpI6ZMNdMsb",
      "classroom"=>false,
    }

    @m1_tutorial = Tutorial.create! mod_1_tutorial_data

    @m1_tutorial.videos.create!({
      "title"=>"Flow Control in Ruby",
      "description"=> Faker::Hipster.paragraph(2, true),
      "video_id"=>"tZDBWXZzLPk",
      "thumbnail"=>"https://i.ytimg.com/vi/tZDBWXZzLPk/hqdefault.jpg",
      "position"=>1
      })

    prework_tutorial_data = {
      "title"=>"Back End Engineering - Prework",
      "description"=>"Videos for prework.",
      "thumbnail"=>"https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg",
      "playlist_id"=>"PL1Y67f0xPzdN6C-LPuTQ5yzlBoz2joWa5",
      "classroom"=>true,
    }
    @prework_tutorial = Tutorial.create! prework_tutorial_data

    @prework_tutorial.videos.create!({
      "title"=>"Prework - Environment Setup",
      "description"=> Faker::Hipster.paragraph(2, true),
      "video_id"=>"qMkRHW9zE1c",
      "thumbnail"=>"https://i.ytimg.com/vi/qMkRHW9zE1c/hqdefault.jpg",
      "position"=>1
      })

    end

  it 'shows classroom only content' do
    visit root_path

    expect(page).to have_content("Back End Engineering - Module 1")
    expect(page).to_not have_content("Back End Engineering - Prework")

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

    expect(page).to have_content("Back End Engineering - Prework")
  end

  it 'filters by tags and classroom content when tags are selected' do
    admin = create(:user, role: 1)

    visit root_path

    click_on "Sign In"
    fill_in 'session[email]', with: admin.email
    fill_in 'session[password]', with: admin.password
    click_on 'Log In'

    visit edit_admin_tutorial_path(@m1_tutorial)

    fill_in'tutorial[tag_list]', with: "Ruby"
    click_on "Update Tags"

    visit root_path

    click_on "Log Out"

    expect(page).to_not have_content("Back End Engineering - Prework")
    expect(page).to have_content("Back End Engineering - Module 1")

    click_on "Ruby"
    expect(page).to_not have_content("Back End Engineering - Prework")
    expect(page).to have_content("Back End Engineering - Module 1")
  end
end
