require 'spec_helper'

describe "product_logs/show" do
  before(:each) do
    @product_log = assign(:product_log, stub_model(ProductLog,
      :msg => "Msg"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Msg/)
  end
end
