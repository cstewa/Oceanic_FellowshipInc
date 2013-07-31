require 'spec_helper'

describe "homepage", js: true do

  before do
    visit root_path
  end

  it "displays the origin pulldown on page load" do
    expect(page).to have_css('origin_airport_pulldown_id')
  end

  it "displays the destination pulldown via AJAX" do
    select('San Francisco', :from => 'origin_airport_pulldown_id')
    click_link "Submit origin"

    expect(page).to have_css('destination_airport_pulldown_id')
  end

  it "displays the departure times pulldown via AJAX" do
    select('San Francisco', :from => 'origin_airport_pulldown_id')
    click_link "Submit origin"
    select('Philadelphia', :from => 'destination_airport_pulldown_id')
    click_link "Submit destination"

    expect(page).to have_css('departure_times_pulldown_id')
  end

  it "redirects to flights show page" do
    select('San Francisco', :from => 'origin_airport_pulldown_id')
    click_link "Submit origin"
    select('Philadelphia', :from => 'destination_airport_pulldown_id')
    click_link "Submit destination"
    select("2013/08/01 18:00:00")
    click_link "View flight"

    expect(page).to have_css('seating_chart_id')
  end

end