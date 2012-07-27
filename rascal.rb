require 'svnmigration'

repos = [
	["rascal", "rascal", "", [], 0, "../default.gitignore"]
	["rascal-eclipse", "rascal-eclipse", "", [], 0, "../default.gitignore"],
	["rascal-experiments", "rascal-experiments", "", [], 0, "../default.gitignore"],
	["rascal-feature", "rascal-feature", "", [], 0, "../default.gitignore"],
	["rascal-fragment", "rascal-fragment", "", [], 0, "../default.gitignore"],
	["rascal-maude", "rascal-maude", "", [], 0, "../default.gitignore"],
	["rascal-msr", "rascal-msr", "--notags --nobranches", [], 0, "../default.gitignore"],
	["rascal-shell", "rascal-shell", "", [], 0, "../default.gitignore"],
	["rascal-plt", "rascal-plt", "", [], 0, "../default.gitignore"],
	["rascal-update-site", "rascal-update-site", "--notags --nobranches", ["*.jar"], 0, "../default.gitignore"],
	["AmbiDexter", "AmbiDexter", "--nobranches", [], 0, "../default.gitignore"],
]
repos.each do |svn, target, options, filters| 
	puts "-----------------------"
	puts "Working on #{svn}"
	puts "-----------------------"

	create_git_repo(svn, target, options, filters)
end
