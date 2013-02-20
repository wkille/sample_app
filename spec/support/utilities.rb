include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email.upcase
  fill_in "Password", with: user.password
  click_button "Sign in"
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end

RSpec::Matchers.define :have_title_text do |text|
  match do |page|
    page.should have_selector('title', text: text)
  end
end

RSpec::Matchers.define :have_h1_text do |text|
  match do |page|
    page.should have_selector('h1', text: text)
  end
end

RSpec::Matchers.define :have_users_link do |href|
  match do |page|
    page.should have_link('Users', href: href)
  end
end

RSpec::Matchers.define :have_profile_link do |href|
  match do |page|
    page.should have_link('Profile', href: href)
  end
end

RSpec::Matchers.define :have_settings_link do |href|
  match do |page|
    page.should have_link('Settings', href: href)
  end
end

RSpec::Matchers.define :have_signout_link do |href|
  match do |page|
    page.should have_link('Sign out', href: href)
  end
end

RSpec::Matchers.define :have_signin_link do |href|
  match do |page|
    page.should have_link('Sign in', href: href)
  end
end

RSpec::Matchers.define :have_div_pagination do
  match do |page|
    page.should have_selector('div.pagination')
  end
end

RSpec::Matchers.define :have_li_username do |text|
  match do |page|
    page.should have_selector('li', text: text)
  end
end
#page.should have_selector('li', text: user.name)

RSpec::Matchers.define :have_delete_link do |href|
  match do |page|
    page.should have_link('delete', href: href)
  end
end
#it { should have_link('delete', href: user_path(User.first)) }

RSpec::Matchers.define :have_success_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-success', text: message)
  end
end
#it { should have_selector('div.alert.alert-success', text: 'Welcome') }

RSpec::Matchers.define :have_changepic_link do |href|
  match do |page|
    page.should have_link('change', href: href)
  end
end
#it { should have_link('change', href: 'http://gravatar.com/emails') }

#RSpec::Matchers.define :have_list_item do |text|
#  match do |page|
#    page.should have_selector("li##{item.id}", text: text)
#  end
#end

#page.should have_selector("li##{item.id}", text: item.content)

def sign_in(user)
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end