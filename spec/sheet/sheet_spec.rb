require 'spec_helper'

describe Sheet do

  describe 'opening sheets' do
    it 'should instantiate Sheet::Open' do
      open = double('Sheet::Open')
      open.should_receive(:open)

      Sheet::Open.stub(:new).with('cucumber') { open }
      Sheet.new('cucumber').process
    end
  end

  describe 'creating sheets' do
    it 'should instantiate Sheet::Write' do
      write = double('Sheet::Write')
      write.should_receive(:write)

      Sheet::Write.stub(:new).with('rails') { write }
      Sheet.new('new', 'rails').process
    end
  end

  describe 'editing sheets' do
    it 'should instantiate Sheet::Write' do
      write = double('Sheet::Write')
      write.should_receive(:write)

      Sheet::Write.stub(:new).with('rails') { write }
      Sheet.new('edit', 'rails').process
    end
  end
end
