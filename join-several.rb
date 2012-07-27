=begin
git filter-branch --index-filter 'git ls-files -sz | perl -0pe "s{\t}{\ttide/}" |	git update-index -z --clear --index-info' --tag-name-filter cat -- --all 
 git filter-branch --index-filter 'rm -f "$GIT_INDEX_FILE" git read-tree --prefix=tide/ "$GIT_COMMIT"' --tag-name-filter cat -- --all 


git filter-branch --index-filter 'git ls-files -s | gsed "s-\t\"*-&tide/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' --tag-name-filter cat -- --all
git filter-branch --index-filter 'git ls-files -s | sed "s-\t\"*-&tide/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE"' --tag-name-filter cat -- --all

git filter-branch --index-filter --prune-empty 'git ls-files -s | sed "s-\t\"*-&newsubdir/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE" || true' HEAD 
git filter-branch --prune-empty --index-filter 'git ls-files -s | sed "s-$(printf '\''\t'\'')\"*-&tide/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && (mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE" || true)' --tag-name-filter cat -- --all

git filter-branch --prune-empty --index-filter 'git ls-files -s | gsed "s-$(printf '\''\t'\'')\"*-&tide/-" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && (mv "$GIT_INDEX_FILE.new" "$GIT_INDEX_FILE" || true)' --tag-name-filter cat -- --all

git filter-branch --commit-filter 'TREE="$1"; shift; SUBTREE=`echo -e 040000 tree $TREE"\ttide" | git mktree`; git commit-tree $SUBTREE "$@"' --tag-name-filter cat -- --all
git filter-branch --commit-filter 'TREE="$1"; shift; SUBTREE=`echo -e 040000 tree $TREE"\tJJTraveler" | git mktree`; git commit-tree $SUBTREE "$@"' --tag-name-filter cat -- --all

rm -rf .git/refs/original/
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now

git filter-branch --commit-filter 'git_commit_non_empty_tree "$@"' --tag-name-filter cat -- --all
=end

require 'fileutils'
require 'ftools'
require 'open3'
require 'pty'
require 'svnmigration'


def join_multiple(repos, target)
	puts "Cleaning up directory"
	target_dir = File.expand_path("../#{target}")
	target_joined_dir = "#{target_dir}/joined"	
	FileUtils.rm_rf(target_dir) if File.directory?(target_dir)
	Dir.mkdir(target_dir)
	Dir.mkdir(target_joined_dir)
	File.copy("committers-meta.txt", "#{target_joined_dir}/committers.txt")

	current_dir = Dir.pwd
	begin
		puts "Preparing the inital repo"
		Dir.chdir(target_joined_dir)
		`git init`
		open("README.md", "w") do |f|
			f.puts "This #{target} repository is a collection of the trunk of the following repositories:"
			f.puts ""
			repos.each do |r, c|
				f.puts "  - #{r}"
			end
		end
		`git add README.md && git commit -m "Added initial readme"`

		repos.each do |r, rev|
			puts "Working on #{r}"
			Dir.chdir(target_joined_dir)
			`svn propget svn:ignore #{rev > 0 ? "-r#{rev - 1}" : ""} svn+ssh://svn.cwi.nl/#{r}/trunk/ > default.gitignore`
			c = rev > 0 ? "--revision 1:#{rev - 1}" : ""
			create_git_repo(r, r, "#{c} --nobranches --notags", [])


			puts "Moving the repository in a subdir"
			Dir.chdir("#{target_dir}/#{r}")
			r_fixed = r.gsub("-","\\-")
			execute_cmd("git filter-branch --prune-empty --index-filter 'git ls-files -s | gsed \"s-$(printf '\\''\\t'\\'')\\\"*-&#{r_fixed}/-\" | GIT_INDEX_FILE=$GIT_INDEX_FILE.new git update-index --index-info && (mv \"$GIT_INDEX_FILE.new\" \"$GIT_INDEX_FILE\" || true)' HEAD")
			`rm -rf .git/refs/original/`
			execute_cmd("git reflog expire --expire=now --all")
			execute_cmd("git gc --prune=now")
			execute_cmd("git gc --aggressive --prune=now")

			puts "Deleting if necesarry"
			if (rev > 0)
				deletion_date = `svn propget svn:date -r#{rev} --revprop svn+ssh://svn.cwi.nl`
				`git rm -rf "#{r}"`
				`GIT_COMMITTER_DATE="#{deletion_date}" git commit --date="#{deletion_date}" -m "Simulated removal of subversion repository"`
			end

			puts "Now merging"
			Dir.chdir(target_joined_dir)
			`git pull --no-ff ../#{r} master`
		end
	ensure
		Dir.chdir(current_dir)
	end
end

#join_multiple([["aterm-csharp", ""], ["relational-aterms", ""]], "meta-stuff")
