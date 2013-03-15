# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name        = "false_destroy"
  s.version     = "0.1.0"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["wxianfeng"]
  s.email       = ["wang.fl1429@gmail.com"]
  s.homepage    = "http://github.com/wxianfeng/false_destroy"
  s.summary     = "after_false_destroy callback"
  s.description = "when mark a record deleted in DB, then run callback after_false_destroy like after_destroy in rails"

  s.required_rubygems_version = ">= 1.3.6"
  s.add_development_dependency("rspec")

  s.files         = Dir['README.md', 'VERSION', 'LICENSE.txt', 'Rakefile', 'lib/**/*']
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ["lib"]

  s.post_install_message = <<-POST_INSTALL_MESSAGE
  false_destroy is a tool for ActiveRecord callback.
  when mark a record deleted in DB, then run callback after_false_destroy like after_destroy in rails, writen in Ruby.
  
  http://github.com/wxianfeng/false_destroy

  Enjoy!

     wxianfeng (wang.fl1429@gmail.com)

  POST_INSTALL_MESSAGE
end
