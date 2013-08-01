require 'spec_helper'

describe "choose seat", js: true do

  before do
    visit [show flight page]
  end

  it "has checkable seats" do
    find('.seat #A1').click
    find('.seat #A2').click

    expect(page).to have_css('div.selected')
  end

  it "submits via book button" do
    find('.seat #A1').click
    find('.seat #A2').click
    find('#bookme').click

    response.body should_contain("Email")
  end
end