require 'capybara/rspec'
require "./rsvp_app"

Capybara.app = RsvpApp

require "spec_helper"

feature "Homepage" do
  scenario "User can dollop a pwop" do
    visit "/"

    expect(page).to have_content("RSVP App")

    click_link "RSVP"
    expect(page).to have_content("Name")

    fill_in("Name", :with => "Peter")
    fill_in("Email", :with => "Peter.a.grunde@gmail.com")
    fill_in("Email", :with => "Peter.a.grunde@gmail.com")
    select "2", from: "Number of Guests"
    choose("dinner_fish")

    click_button "RSVP"
    expect(page).to have_content("RSVPing")

  end
end