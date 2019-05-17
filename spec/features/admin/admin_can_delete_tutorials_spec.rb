require 'rails_helper'

describe 'as an admin' do
  it 'allows me to delete tutorials' do
    admin = create(:user, role: 1)
    tutorial = create(:tutorial)
    video1 = create(:video, tutorial_id: tutorial.id)

    admin = create(:admin)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_dashboard_path

    expect(page).to have_content(tutorial.title)

    within(first(".admin-tutorial-card")) do
      click_on 'Destroy'
    end

    expect(page).to have_content("#{tutorial.title} has been deleted.")

    within("#tutorials") do
      expect(page).to_not have_content(tutorial.title)
    end
  end
end
