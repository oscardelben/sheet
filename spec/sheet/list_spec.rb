
require 'spec_helper'

describe Sheet::List do

  it 'calls system ls' do
    cmd = "ls #{Sheet.sheets_dir}"
    Shret.should_receive(:exec).with(cmd, true)

    Sheet::List.new.list
  end

end
