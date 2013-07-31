require 'spec_helper'

describe "login_page", js: true do

  before do
    visit login_path
  end

  it "signs up" do
    click_link "Sign Up"

    response.body should_contain("Email")
  end

  it "actually signs up" do
    click_link "Sign Up"
    fill_in "Email", with: "christina@isthebest.com"
    fill_in "Password", with: "christina"

    find('#signup_button').click
    response.body should_contain("A1")
  end


  it "guest checks out" do
    find('#guest_checkout_button').click

    response.body should_contain("Email")
  end

  it "actually guest checks out" do
    find('#guest_checkout_button').click
    fill_in "Email", with: "guest@guest.com"
    click_link "Checkout"

    response.body should_contain("div#selection_window")
  end

end

describe "login_page_submits" do

  before do
    visit login_path
  end

  it "logs in with email and password" do
    fill_in "Email", with: "harrison@harrison.com"
    fill_in "Password", with: "harrison"
    find('#login_button').click

    response.body should_contain("A1")
  end



end