require 'spec_helper'

describe "tengine_batches/index" do
  before(:each) do
    assign(:tengine_batches, [
      stub_model(Tengine::Batch,
        :name => "Name",
        :status_cd => 1,
        :logs => ""
      ),
      stub_model(Tengine::Batch,
        :name => "Name",
        :status_cd => 1,
        :logs => ""
      )
    ])
  end

  it "renders a list of tengine_batches" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
