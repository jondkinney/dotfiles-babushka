#!/usr/bin/env ruby

# `touch do_not_start_pivotal_story.txt`

locals = %w(master staging production)
remotes = []

`git fetch --quiet --prune`
`git checkout master --quiet`

`git branch -a`.each_line do |line|
  line.strip! # remove \n
  line.gsub!(/\*\s/, '') # remove current branch indicator
  if line.match(/remotes\//) && !line.match(/HEAD/)
    tmp1 = line.split('/')
    tmp2 = tmp1.reverse.pop(2) # get rid of remotes/origin
    remotes << (tmp1 - tmp2).join('/')
  else
    locals << line
  end
end

remotes.each do |remote|
  next if locals.include?(remote)
  `git checkout -t origin/#{remote} --quiet`
end

`git checkout master --quiet`

if (remotes - locals).count == 0
  puts
  puts 'All remote branches already checked out locally'
  puts
else
  puts
  puts 'Checked out remote branches:'
  (remotes - locals).each do |branch|
    puts "  * #{branch}"
  end
  puts
end

# `rm do_not_start_pivotal_story.txt`
