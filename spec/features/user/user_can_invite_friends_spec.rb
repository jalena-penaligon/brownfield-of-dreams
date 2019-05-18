require "rails_helper"

describe "As a registered, logged in user", :vcr do
  it "allows me to invite friends by email" do
    user = create(:user, github_login: "asdf", access_token: ENV["GITHUB_TOKEN_KEY"])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    click_link "Send an Invite"

    expect(current_path).to eq(new_invite_path)

    expect(page).to have_content("Enter valid github handle")
    fill_in "handle", with: "jtaylor522"
    click_button "Send Invite"
    expect(page).to have_content("Successfully sent invite!")
    expect(current_path).to eq(dashboard_path)
  end

  it "does not allow me to invite invalid users", :vcr do
    user = create(:user, github_login: "asdf", access_token: ENV["GITHUB_TOKEN_KEY"])
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit dashboard_path
    click_link "Send an Invite"

    expect(current_path).to eq(new_invite_path)

    expect(page).to have_content("Enter valid github handle")
    fill_in "handle", with: "iamnotavalidgithubname"
    click_button "Send Invite"
    error = "The github user you selected does not have a valid email address associated with their account."
    expect(page).to have_content(error)
    expect(current_path).to eq(invite_path)
  end
end
