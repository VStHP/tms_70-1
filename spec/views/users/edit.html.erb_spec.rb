require "rails_helper"
RSpec.describe "users/edit", type: :view do
  let(:user) {FactoryGirl.create(:user)}
  subject {user}

  it "renders the edit user form" do
    assign(:user, subject)
    render
    assert_select "form[action=?][method=?]", user_path(user), "post" do
      assert_select "input#user_name[name=?]", "user[name]"
      assert_select "input#user_email[name=?]", "user[email]"
      assert_select "input#user_organization[name=?]", "user[organization]"
      assert_select "input#user_program[name=?]", "user[program]"
      assert_select "input#user_avatar[name=?]", "user[avatar]"
    end
  end
end
