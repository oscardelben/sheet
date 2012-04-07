
require 'spec_helper'

describe Sheet::List do

  it 'calls system ls' do
    cmd = "ls #{Sheet::SHEETS_DIR}"
    Sheet.should_receive(:exec).with(cmd)

    Sheet::List.new.list
  end

end
