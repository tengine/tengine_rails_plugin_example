require 'spec_helper'

describe "product_logs/edit" do
  before(:each) do
    @product_log = assign(:product_log, stub_model(ProductLog,
      :msg => "MyString"
    ))
  end

  it "renders the edit product_log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_logs_path(@product_log), :method => "post" do
      assert_select "input#product_log_msg", :name => "product_log[msg]"
    end
  end
end
