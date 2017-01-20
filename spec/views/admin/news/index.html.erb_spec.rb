require 'rails_helper'

RSpec.describe "admin/news/index", type: :view do
  let(:user) { Signup::User.create(firstname: 'Rails', lastname: 'Admin', email: 'a@s.com', password: 'secret', admin: true) }
  before do
    assign(:current_user, user)
  end

  before(:each) do
    assign(:admin_news, [
      Admin::News.create!(
        :name => "Name",
        :description => "MyText"
      )

    ])
  end

  it "renders a list of admin/news" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 1
    assert_select "tr>td", :text => "MyText".to_s, :count => 1
  end
end
