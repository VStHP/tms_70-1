require "rails_helper"
RSpec.describe "users/show.html.erb", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  subject {user}

  it "displays user details" do
    assign(:user, subject)
    render
    expect(response.body).to include("/assets/imagedefault/avatar-1f2c5b46fec65b4a3ed78b5d5dad5c40c67befe3a37e3fd9bc91e68dbc5eb45a.png")
    expect(response.body).to have_css(".img-circle")
    expect(response.body).to have_css(".img-responsive")
    expect(subject).to render_template("users/show")
    expect(rendered).to include (user.name)
    expect(rendered).to include (user.email)
    expect(rendered).to include (user.university)
  end
end
