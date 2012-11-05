require 'spec_helper'

describe "tengine_batches/show" do
  before(:each) do
    @batch = assign(:batch, stub_model(Tengine::Batch,
      :name => "Name",
      :status_cd => 1,
      :logs => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
