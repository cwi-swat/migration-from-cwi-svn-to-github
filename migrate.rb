require 'svnmigration'

repos = [
	#["rascal", "rascal", "", []]
	#["rascal-shell", "rascal-shell", "", []],
	#["rascal-eclipse", "rascal-eclipse", "", []],
	#["rascal-update-site", "rascal-update-site", "--notags --nobranches", ["*.jar"]],
	#["AmbiDexter", "AmbiDexter", "--nobranches", []],
	#["rascal-experiments", "rascal-experiments", "", []],
	["saga", "saga", "", []]
]
repos.each do |svn, target, options, filters| 
	puts "-----------------------"
	puts "Working on #{svn}"
	puts "-----------------------"

	create_git_repo(svn, target, options, filters)
end
