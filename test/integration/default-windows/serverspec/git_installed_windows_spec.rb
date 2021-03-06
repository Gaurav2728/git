# frozen_string_literal: true
require 'serverspec'

set :backend, :cmd
set :os, family: 'windows'

PROGRAM_FILES = ENV['ProgramFiles(x86)'] || ENV['ProgramFiles']
GIT_PATH = "#{PROGRAM_FILES}\\Git\\Cmd".freeze

puts "PROGRAM_FILES: #{PROGRAM_FILES}"
puts "GIT_PATH: #{GIT_PATH}"
puts "PATH: #{ENV['PATH']}"

describe 'git::default' do
  describe command('git --version') do
    its(:exit_status) { should eq 0 }
  end
end
