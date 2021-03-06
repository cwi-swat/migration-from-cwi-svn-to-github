require 'join-several'
require 'svnmigration'
#svn log -v svn+ssh://svn.cwi.nl | grep -B 2 "D /amstin" | head -1 | grep 'r[0-9]*' | awk '{print $1}' 
singles = [
	 ["action-semantics-tools", "action-semantics-tools", "", []],
	["amstin", "amstin", "--revision 1:38674", [], 38675],
	["clafer", "clafer", "", []],
	["rascal-dokre", "dokre", "", []],
	["funcons", "funcons", "--rootistrunk", []],
	["grammar-metrics", "grammar-metrics", "", []],
	["JJTraveler", "jjtraveler", "", []],
	["JJTraveler-csharp", "jjtraveler-csharp", "", []],
	["j0beron", "j0beron", "", []],
	["JRelCal", "jrelcal", "", []],
	["lwc", "language-workbench-competition", "", []],
	["ldta-www", "ldta-www", "", []],
	["MetaBlitz", "meta-blitz", "--rootistrunk", []],
	["missgrant", "missgrant", "", []],
	["oberon0", "oberon0", "", []],
	["pacioli", "pacioli", "", []],
	["php", "php-analysis", "", []],
	["quanda", "quanda", "", []],
	["saga", "saga", "", []],
	["relation-stores", "relation-stores", "--revision 1:25291", [], 25292],
	["resources", "resources", "", []],
	["sordini", "sordini", "", []],
	["jsaf", "super-awesome-fighters", "", []],
	["example-systems", "swat-corpora", "", []],
	["syntactic-clojure", "syntactic-clojure", "", []],
	["timelytree","timelytree","--rootistrunk", []],
	["TyMoRe", "tymore", "--rootistrunk", []],
	["V2I", "visitor-to-interpreter", "--rootistrunk", [], 0, "/dev/null"],
	["waebric", "waebric", "", []],
	["extreme-team-collaboration","extreme-team-collaboration","",[]]
]

combinations = [
	 [
	 	[
			["apigen", 0,""],
			["aterm", 0,""],
		    ["aterm-csharp", 0,""],
		    ["aterm-java", 0,""],
		    ["aterm-xml", 0,""],
			["balanced-binary-aterms", 0,""],
			["relational-aterms", 0,""],
			["shared-objects", 0,""],
			["shared-objects-csharp", 0,""],
		], "aterms"
	],
	[
		[
			["asf-fragment", 26938,""],
			["asfsdf-feature", 0,""],
			["asfsdf-fragment", 0,""],
			["asfsdf-meta-eclipse-imp", 0,""],
			["asfsdf-plugin", 0,""],
			["aterm-to-pbf", 0,""],
			["meta-eclipse", 26954,"--rootistrunk"],
			["meta-eclipse-imp", 0,""],
			["org.eclipse.imp.pdb.viz.graph", 25962,""],
			["sdf-eclipse-installer", 0,""],
			["sdf-eclipse-installer-feature", 0,""],
			["sdf-eclipse-installer-linux-x86", 0,""],
			["sdf-eclipse-installer-macosx-x86", 0,""],
			["sdf-eclipse-installer-win32-x86", 0,""],
			["sglr-invoker", 0,""],
			["studio-plugin-template", 0,""],
			["toolbus-ide", 0,""],
			["vis-plugin-charts-imp", 0,""],
			["vis-plugin-generic-imp", 0,""],
			["vis-plugin-graph-imp", 0, ""]
		], "eclipse-meta-environment"
	],
	[
		[
			["asc-support", 0,""],
			["asdf", 0,""],
			["asf", 0,""],
			["asf-library", 0,""],
			["asfsdf-meta", 0,""],
			["asf-support", 0,""],
			["atermpp", 0,""],
			["autocode", 0,""],
			["BusPrototype", 0,""],
			["c-library", 0,""],
			["config-manager", 0,""],
			["config-support", 0,""],
			["config-support-java", 0,""],
			["console-grabber", 0,""],
			["console-gui", 0,""],
			["coolswing-gui", 22355,""],
			["c-tools", 0,""],
			["defacto", 0,""],
			["default-studio-plugin", 21714,""],
			["dialog-gui", 0,""],
			["diff-gui", 0,""],
			["editor-manager", 0,""],
			["editor-plugin", 0,""],
			["error-gui", 0,""],
			["error-support", 0,""],
			["error-support-java", 0,""],
			["fst", 0,""],
			["java-meta", 0,""],
			["java-meta2", 20429,"--rootistrunk"],
			["java-sglr", 0,""],
			["jitty-env", 0,""],
			["meta", 0,""],
			["meta-autotools", 0,""],
			["meta-build-env", 0,""],
			["meta-checklist", 0,""],
			["meta-doc", 0,""],
			["metagvim", 0,""],
			["meta-javatools", 0,""],
			["meta-kernel", 19185,""],
			["meta-query", 0,""],
			["meta-studio", 0,""],
			["mingw-patches", 0,""],
			["mod-toolbus", 0,""],
			["module-details-gui", 0,""],
			["module-manager", 0,""],
			["module-support", 25127,""],
			["module-support-java", 0,""],
			["navigator-gui", 0,""],
			["offside", 0,""],
			["pandora", 0,""],
			["pgen", 0,""],
			["prefuse-plugins", 22862,""],
			["progress-gui", 0,""],
			["ptable-support", 0,""],
			["ptpretty", 0,""],
			["pt-support", 0,""],
			["pt-support-java", 0,""],
			["relation-calculus", 21598,""],
			["rscript", 0,""],
			["sdf", 0,""],
			["sdf-apigen", 0,""],
			["sdf-library", 0,""],
			["sdf-meta", 0,""],
			["sdf-metrics", 0,""],
			["sdf-pretty", 0,""],
			["sdf-support", 0,""],
			["sen1-dev-tools", 26955,""],
			["sets-and-relations-library", 0,""],
			["sglr", 0,""],
			["sisyphus", 0,""],
			["sisyphus-configuration", 0,"--rootistrunk"],
			["sisyphus-support", 0,""],
			["structure-editor", 0,""],
			["svg-gui", 0,""],
			["svg-support", 0,""],
			["term-store", 0,""],
			["tide", 0,""],
			["tide-support", 0,""],
			["tifsto", 24980,""],
			["toolbus", 0,""],
			["toolbus-demos", 0,""],
			["toolbus-java-adapter", 0,""],
			["toolbuslib", 0,""],
			["toolbus-ng", 0,""],
			["toolbusNG", 24003,""],
			["toolbus-ng-argus-viewer", 0,""],
			["toolbus-ng-eclipse-imp", 0,""],
			["toolbus-recorder", 0,""],
			["toolbus-wish-adapter", 0,""],
			["tree-gui", 0,""],
			["vis-base", 0,""],
			["vis-plugin", 0,""],
			["vis-plugin-barchart", 22890,""],
			["vis-plugin-charts", 0,""],
			["vis-plugin-csv", 23387,""],
			["vis-plugin-evolution", 0,""],
			["vis-plugin-generic", 0,""],
			["vis-plugin-graph", 0,""],
			["vis-plugin-linechart", 22890,""],
			["vis-plugin-piechart", 22890,""],
			["vis-plugin-prefuse", 22889,""],
			["vis-plugin-scatterchart", 22890,""],
			["vis-plugins-prefuse", 22863,""],
			["vis-plugin-table", 23388,""],
			["vis-plugin-treemap", 0,""],
			["visualization-plugins", 22861,""],
	                ["graph-browser", 0,""],
			["graphbrowser", 30151,""],
			["graph-gui", 0,""],
			["graph-support", 0,""],
			["graph-support-java", 0,""],
			["io-support", 0,""],
			["io-support-java", 0, ""]
		], "meta-environment"
	],
	[
		[
			["rscript-meta", 0,""],
			["rstore-container", 0,""],
			["rstore-support", 0,""],
			["rstore-support-java", 0,""],
		], "rscript-meta"
	],
	[
		[
			["SGLL", 33667,""],
			["SBFGTD", 0,""]
		], "sbfgtd"
	]
]

ignored = ["derric", "101companies", "chess-dsl", "clops", "CommCenter", "concurrent-data-structures", "d2", "data-structures", "git-www", "java-source-analysis", "pheme", "regService", "services"]

#combinations.each { |repos, target| join_multiple(repos, target) }
#singles.each { |svn, git, cmd, filters, rev, ignore| create_git_repo(svn, git, cmd, filters, rev == nil ? 0 : rev, ignore == nil ? "" : ignore) }

combinations.each { |r, target|
	current_dir = Dir.pwd
	begin
		Dir.chdir("../#{target}/joined/")
		puts "Now pushing #{target} = #{`du -sh .git/`}"
		`git remote add origin git@github.com:cwi-swat/#{target}.git`
		execute_cmd("git push -f origin master")
	ensure	
		Dir.chdir(current_dir)
	end
}
singles.each do |svn, target| 
	current_dir = Dir.pwd
	begin
		Dir.chdir("../#{target}/")
		puts "Now pushing #{target} = #{`du -sh .git/`}"
		`git remote add origin git@github.com:cwi-swat/#{target}.git`
		execute_cmd("git push -f --all")
		execute_cmd("git push -f --tags")
	ensure
		Dir.chdir(current_dir)
	end
end
#def checkValid(r, rev, c) 
#	`svn ls  --depth empty svn+ssh://svn.cwi.nl/#{r}#{c.index("rootistrunk") == nil ? "/trunk":""}#{rev >0 ? "@#{rev-1}":""}`
#end
#combinations.each { |repos, target| repos.each { |r, rev, c| checkValid(r,rev,c)  } }
#singles.each { |s, r, c, f, rev| checkValid(s,rev == nil ? 0 : rev, c)  } 
