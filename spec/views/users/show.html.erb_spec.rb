require 'spec_helper'

describe "users/show.html.erb" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :name => "Name",
      :motto => "Motto",
      :pet_name => "Pet Name",
      :mood => "Mood"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Motto/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Pet Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mood/)
  end
end
