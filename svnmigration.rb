require 'fileutils'
require 'ftools'
require 'open3'
require 'pty'

def execute_cmd(cmd)
	begin
	  PTY.spawn( cmd ) do |stdin, stdout, pid|
		begin
		  stdin.each { |line| print line }
		rescue Errno::EIO
		  puts "Errno:EIO error, but this probably just means " +
				"that the process has finished giving output"
		end
	  end
	rescue PTY::ChildExited
	  puts "The child process exited!"
	end
end

def create_git_repo(svn_name, git_name, extra_params, filters, lastrev =0, gitignore_file = "")
	puts "Cleaning up directory"
	target_dir = "../#{git_name}"
	FileUtils.rm_rf(target_dir) if File.directory?(target_dir)
	Dir.mkdir(target_dir)
	
	current_dir = Dir.pwd
	begin
		puts "Starting svn2git script"
		Dir.chdir(target_dir)
		execute_cmd("svn2git svn+ssh://svn.cwi.nl/#{svn_name} -v --authors #{current_dir}/committers.txt #{extra_params}")

		puts "Adding new .gitignore"
		last_date = `git show -s --format="%ci" HEAD`
		if (gitignore_file != "")
			File.copy(gitignore_file, "#{target_dir}/.gitignore")
		else
			puts gitignore_file
			`svn propget svn:ignore #{lastrev > 0 ? "-r#{lastrev - 1}" : ""} svn+ssh://svn.cwi.nl/#{svn_name}/trunk/ > .gitignore`
		end
		`git add .gitignore`
		`GIT_COMMITTER_DATE="#{last_date}" git commit --date="#{last_date}" -m "Added gitignore file"`

		puts "Filtering history if needed"
		filters.each do |f|
			execute_cmd("git filter-branch --index-filter 'git rm --cached --ignore-unmatch \"#{f}\"' --prune-empty --tag-name-filter cat -- --all")
			`rm -rf .git/refs/original/`
		end
		if not filters.empty?
			execute_cmd("git reflog expire --expire=now --all")
			execute_cmd("git gc --prune=now")
			execute_cmd("git gc --aggressive --prune=now")
		end
	ensure
		Dir.chdir(current_dir)
	end
end
