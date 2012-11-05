require 'spec_helper'

describe "tengine_batches/new" do
  before(:each) do
    assign(:batch, stub_model(Tengine::Batch,
      :name => "MyString",
      :status_cd => 1,
      :logs => ""
    ).as_new_record)
  end

  it "renders new batch form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tengine_batches_path, :method => "post" do
      assert_select "input#batch_name", :name => "batch[name]"
      assert_select "input#batch_status_cd", :name => "batch[status_cd]"
      assert_select "input#batch_logs", :name => "batch[logs]"
    end
  end
end
