require 'spec_helper'

describe Sheet::Copy do

  it 'should copy the snippet' do
    cmd = "cat #{Sheet.sheet_path('git')} | pbcopy"
    Sheet.should_receive(:exec).with(cmd, true)

    Sheet.stub(:copy_command) { 'pbcopy' }
    Sheet.stub(:sheet_exists?).with('git') { true }

    Sheet::Copy.new('git').copy
  end

  it 'should show an error if name is nil' do
    Sheet.should_receive(:write).with("Please specify a sheet name!")

    Sheet::Copy.new(nil).copy
  end

  it 'should show an error if snippet is not found' do
    Sheet.should_receive(:write).with("A sheet named git could not be found")
    Sheet.stub(:sheet_exists?).with('git') { false }

    Sheet::Copy.new('git').copy
  end

  it 'should show a message if no copy program was found' do
    Sheet.should_receive(:write).with("Could not copy sheet, no copy command found")

    Sheet.stub(:copy_command) { nil }
    Sheet.stub(:sheet_exists?).with('git') { true }

    Sheet::Copy.new('git').copy
  end

end

