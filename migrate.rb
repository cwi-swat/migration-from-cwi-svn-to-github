require 'svnmigration'

repos = [
	["rascal", "rascal", "", []]
	["rascal-eclipse", "rascal-eclipse", "", []],
	["rascal-experiments", "rascal-experiments", "", []],
	["rascal-feature", "rascal-feature", "", []],
	["rascal-fragment", "rascal-fragment", "", []],
	["rascal-maude", "rascal-maude", "", []],
	["rascal-msr", "rascal-msr", "--notags --nobranches", []],
	["rascal-shell", "rascal-shell", "", []],
	["rascal-plt", "rascal-plt", "", []],
	["rascal-update-site", "rascal-update-site", "--notags --nobranches", ["*.jar"]],
	["AmbiDexter", "AmbiDexter", "--nobranches", []],
]
repos.each do |svn, target, options, filters| 
	puts "-----------------------"
	puts "Working on #{svn}"
	puts "-----------------------"

	create_git_repo(svn, target, options, filters)
end
