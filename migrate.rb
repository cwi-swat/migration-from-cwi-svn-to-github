require 'fileutils'
require 'open3'
require 'pty'

def create_git_repo(svn_name, git_name, extra_params, filter)
	target_dir = "../#{git_name}"
	FileUtils.rm_rf(target_dir) if File.directory?(target_dir)
	Dir.mkdir(target_dir)
	
	current_dir = Dir.pwd
	begin
		Dir.chdir(target_dir)
		cmd = "svn2git svn+ssh://svn.cwi.nl/#{svn_name} -v --authors #{current_dir}/committers.txt #{extra_params}"
		begin
		  PTY.spawn( cmd ) do |stdin, stdout, pid|
			begin
			  # Do stuff with the output here. Just printing to show it works
			  stdin.each { |line| print line }
			rescue Errno::EIO
			  puts "Errno:EIO error, but this probably just means " +
					"that the process has finished giving output"
			end
		  end
		rescue PTY::ChildExited
		  puts "The child process exited!"
		end
	ensure
		Dir.chdir(current_dir)
	end
end

create_git_repo("rascal-shell", "rascal-shell", "", [])
