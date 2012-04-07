require 'spec_helper'

describe Sheet::Open do

  it "should show a message when the app doesn't exist" do
    message = "A cheat named rails doesn't exist.\nYou can create one with sheet new rails"
    Sheet.should_receive(:write).with(message)

    Sheet::Open.new('rails').open
  end

  it "should output the sheet content" do
    message = "My sheet about git"
    Sheet.should_receive(:write).with(message)

    s = Sheet::Open.new('git')
    Sheet.stub(:sheet_exists?).with('git') { true }
    s.stub(:sheet_content) { message }
    s.open
  end

  it "should open a url" do
    Sheet.stub(:open_command) { 'open' }
    message = "url: http://example.com"
    Sheet.should_receive(:exec).with('open http://example.com')

    s = Sheet::Open.new('git')
    Sheet.stub(:sheet_exists?).with('git') { true }
    s.stub(:sheet_content) { message }
    s.open
  end

  it "should fallback to showing the content if an open command is not present" do
    Sheet.stub(:open_command) { nil}
    message = "url: http://example.com"
    Sheet.should_receive(:puts).with('url: http://example.com')

    s = Sheet::Open.new('git')
    Sheet.stub(:sheet_exists?).with('git') { true }
    s.stub(:sheet_content) { message }
    s.open
  end
end
