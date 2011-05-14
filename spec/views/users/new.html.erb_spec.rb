require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString",
      :motto => "MyString",
      :pet_name => "MyString",
      :mood => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_motto", :name => "user[motto]"
      assert_select "input#user_pet_name", :name => "user[pet_name]"
      assert_select "input#user_mood", :name => "user[mood]"
    end
  end
end
