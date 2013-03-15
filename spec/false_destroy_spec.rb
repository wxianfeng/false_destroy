#encoding:utf-8
require 'spec_helper'

describe FalseDestroy do

	it "column_name, when_name default name"  do 
		FalseDestroy.column_name.should == 'deleted'
		FalseDestroy.when_name.should == 'deleted_at'
	end

	it "assign column_name" do
		FalseDestroy.column_name = 'destroyed'
		FalseDestroy.column_name.should == 'destroyed'
	end

	it "version" do 
		p FalseDestroy::VERSION
	end
	
end