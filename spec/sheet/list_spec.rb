require 'spec_helper'

describe Sheet::List do

  context 'when sheets directory exists' do
    before do
      Sheet.stub(:sheets_directory_exists?) { true }
    end

    it 'calls system ls' do
      cmd = "ls -1 #{Sheet.sheets_dir}"
      Sheet.should_receive(:exec).with(cmd, true)

      Sheet::List.new.list
    end
  end

  context 'when sheets directory doesn\'t exist' do
    before do
      Sheet.stub(:sheets_directory_exists?) { false }
    end

    it 'shows a message' do
      Sheet.should_receive(:display).with("No sheet found. Create a new sheet with `sheet new <name>`")

      Sheet::List.new.list
    end
  end
end
