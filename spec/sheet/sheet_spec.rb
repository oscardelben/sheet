require 'spec_helper'

describe Sheet do

  describe 'opening sheets' do
    it "should instantiate Sheet::Open" do
      open = double('Sheet::Open')
      open.should_receive(:open)

      Sheet::Open.stub(:new).with('cucumber') { open }
      Sheet.new('cucumber').process
    end
  end

end
