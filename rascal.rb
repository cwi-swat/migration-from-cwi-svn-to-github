require 'svnmigration'

repos = [
	["rascal", "rascal", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-eclipse", "rascal-eclipse", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-experiments", "rascal-experiments", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-feature", "rascal-feature", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-fragment", "rascal-fragment", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-maude", "rascal-maude", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-msr", "rascal-msr", "--notags --nobranches", [], 0, File.expand_path("default.gitignore")],
	["rascal-shell", "rascal-shell", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-plt", "rascal-plt", "", [], 0, File.expand_path("default.gitignore")],
	["rascal-update-site", "rascal-update-site", "--notags --nobranches", ["*.jar"], 0, File.expand_path("default.gitignore")],
	["AmbiDexter", "AmbiDexter", "--nobranches", [], 0, File.expand_path("default.gitignore")],
]
repos.each do |svn, target, options, filters, rev, ignore| 
	puts "-----------------------"
	puts "Working on #{svn}"
	puts "-----------------------"

	create_git_repo(svn, target, options, filters, rev, ignore)
end
