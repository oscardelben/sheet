require 'spec_helper'

describe Sheet::Write do

  let (:editor) { 'vim' }

  it 'opens a new file for writing' do
    cmd = "#{editor} #{Sheet.sheet_path('tmux')}"
    Sheet.should_receive(:exec).with(cmd)

    Sheet.stub(:editor) { editor }

    Sheet::Write.new('tmux').write
  end

  it 'returns an error if no editor is found' do
    Sheet.stub(:editor) { nil }
    Sheet.should_receive(:write).with { "Please set the $EDITOR variable to write files" }

    Sheet::Write.new('tmux').write
  end
end
