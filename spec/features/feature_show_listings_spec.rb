feature 'Show listings' do
  scenario 'it displays listings when the user navigates to the homepage' do
    visit '/'
    expect(page).to have_text 'poshhouse'
    expect(page).to have_text 'London'
    expect(page).to have_text 'small castle'
  end
end
feature 'Sign up' do
  scenario "it has a link to sign up if the user isn't signed in" do
    visit '/'
    expect(page).to have_link('Sign up', href: "/users/new")
  end
end
feature 'Sign in' do
  scenario "it has a link to sign in if the user isn't signed in" do
    visit '/'
    expect(page).to have_link('Sign in', href: "/session/new")
  end
end
