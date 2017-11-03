require "rails_helper"
RSpec.describe "users/index.html.erb", type: :view do

  it "displays all users" do
    assign(:users, [
      User.create(name: "User1", email: "abc123@gmail.com", password: "123123", password_confirmation: "123123"),
      User.create(name: "User2", email: "abc1234@gmail.com", password: "123123", password_confirmation: "123123")
    ])
    allow(view).to receive_messages(:will_paginate => nil)
    render
    expect(rendered).to match /User1/
    expect(rendered).to match /User2/
  end

  it "renders the user partial for each user" do
    assign(:users, [
      User.create(name: "User1", email: "abc123@gmail.com", password: "123123", password_confirmation: "123123"),
      User.create(name: "User2", email: "abc1234@gmail.com", password: "123123", password_confirmation: "123123")
    ])
    allow(view).to receive_messages(:will_paginate => nil)
    stub_template "users/_user.html.erb" => "<%= user.name %><br/>"
    render
    expect(rendered).to match /User1/
    expect(rendered).to match /User2/
  end
end
