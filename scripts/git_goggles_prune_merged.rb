#!/usr/bin/env ruby

explain = true if ARGV.first == 'explain'

local_branches = []
`git branch --merged`.each_line do |line|
  line.strip!
  local_branches << line unless line.include?('* ')
end

branches_to_ignore = %w(master staging production)

deleted = []

local_branches.each do |local_branch|
  next if branches_to_ignore.include? local_branch

  unless explain
    `git push origin --delete #{local_branch}`
    `git branch -d #{local_branch}`
  end

  deleted << local_branch
end

message = explain ? 'Would have d' : 'D'
message << 'eleted the following already merged branches:'
puts message

deleted.each do |del|
  puts "  * #{del}"
end
