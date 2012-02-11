# -*- encoding : utf-8 -*-
# Unit test for EasyEditor
#
#
require_relative "../lib/easyeditor"

include Easyeditor

describe EasyEditor do
	before(:each) do
		@ee = EasyEditor.new("lib/easyedito")
	end
	it "lib/easyeditor will get file :./lib/easyeditor.rb " do
		@ee.target_files.should == ["./lib/easyeditor.rb"]
	end
end
