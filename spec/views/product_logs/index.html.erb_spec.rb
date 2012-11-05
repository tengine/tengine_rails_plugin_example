require 'spec_helper'

describe "product_logs/index" do
  before(:each) do
    assign(:product_logs, [
      stub_model(ProductLog,
        :msg => "Msg"
      ),
      stub_model(ProductLog,
        :msg => "Msg"
      )
    ])
  end

  it "renders a list of product_logs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Msg".to_s, :count => 2
  end
end
