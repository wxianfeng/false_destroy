#encoding:utf-8
require 'version'

module FalseDestroy

	mattr_accessor :column_name
	self.column_name = 'deleted'
	mattr_accessor :when_name
	self.when_name = 'deleted_at'

	module Callbacks
		def self.included(base)
			base.extend ClassMethods
			base.class_eval {
				include InstanceMethods
				define_model_callbacks :false_destroy, :only => :after
			}
		end

		module ClassMethods
			# Nothing
		end

		module InstanceMethods
			def false_destroy
				name = FalseDestroy.column_name
				_when = FalseDestroy.when_name
				self.send("#{name}=",true) if self.respond_to? name
				self.send("#{_when}=",Time.now) if self.respond_to?  _when
				self.save
				run_callbacks :false_destroy
			end

			def false_destroy!
				name = FalseDestroy.column_name
				_when = FalseDestroy.when_name
				self.send("#{name}=",true) if self.respond_to? name
				self.send("#{_when}=",Time.now) if self.respond_to?  _when
				self.save!
				run_callbacks :false_destroy
			end
		end
	end
end

ActiveRecord::Base.send :include, FalseDestroy::Callbacks