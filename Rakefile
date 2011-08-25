#!/usr/bin/env rake

bundler_installed = !!(%x[gem list] =~ /bundler/)

if bundler_installed
  task :default => :server

  desc "Start the Rack server"
  task :server do
    sh 'bundle exec rackup'
  end
else
  task :default => :setup
end

desc "Setup the local environment"
task :setup do
  sh 'gem install bundler --no-ri --no-rdoc' unless bundler_installed
  sh 'bundle install'
  puts "Done!\n\n"
end
