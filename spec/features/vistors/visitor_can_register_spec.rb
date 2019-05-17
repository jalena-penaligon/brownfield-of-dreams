require 'rails_helper'

describe 'as a visitor', :vcr, :js do
  it 'will register a new account' do
    visit root_path

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: 'jimbob@aol.com'
    fill_in 'user[first_name]', with: 'Jim'
    fill_in 'user[last_name]', with: 'Bob'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_on'Create Account'

    expect(current_path).to eq(dashboard_path)

    expect(page).to have_content('jimbob@aol.com')
    expect(page).to have_content('Jim')
    expect(page).to have_content('Bob')
    expect(page).to_not have_content('Sign In')
  end

  it 'will not allow a user to register with an existing email' do
    user = create(:user, email: 'jimbob@aol.com')

    visit login_path

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: 'jimbob@aol.com'
    fill_in 'user[first_name]', with: 'Jim'
    fill_in 'user[last_name]', with: 'Bob'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_on'Create Account'

    expect(page).to have_content('Username already exists')
  end

  it 'sends an email confirmation token after registration' do
    visit root_path

    click_on 'Sign In'

    expect(current_path).to eq(login_path)

    click_on 'Sign up now.'

    expect(current_path).to eq(new_user_path)

    fill_in 'user[email]', with: 'jimbob@aol.com'
    fill_in 'user[first_name]', with: 'Jim'
    fill_in 'user[last_name]', with: 'Bob'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'

    click_on'Create Account'

    user = User.last

    expect(user.email_confirmed).to eq(false)
    expect(user.confirm_token).to be_a(String)
  end
end
