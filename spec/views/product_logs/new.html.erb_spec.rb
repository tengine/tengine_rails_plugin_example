require 'spec_helper'

describe "product_logs/new" do
  before(:each) do
    assign(:product_log, stub_model(ProductLog,
      :msg => "MyString"
    ).as_new_record)
  end

  it "renders new product_log form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => product_logs_path, :method => "post" do
      assert_select "input#product_log_msg", :name => "product_log[msg]"
    end
  end
end
