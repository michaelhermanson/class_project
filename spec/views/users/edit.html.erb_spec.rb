require 'spec_helper'

describe "users/edit.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "MyString",
      :motto => "MyString",
      :pet_name => "MyString",
      :mood => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_path(@user), :method => "post" do
      assert_select "input#user_name", :name => "user[name]"
      assert_select "input#user_motto", :name => "user[motto]"
      assert_select "input#user_pet_name", :name => "user[pet_name]"
      assert_select "input#user_mood", :name => "user[mood]"
    end
  end
end
