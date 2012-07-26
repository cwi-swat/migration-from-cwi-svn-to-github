require 'join-several'
#svn log -v svn+ssh://svn.cwi.nl | grep -B 2 "D /amstin" | head -1 | grep 'r[0-9]*' | awk '{print $1}' 
singles = [
	 ["action-semantics-tools", "action-semantics-tools", "", []],
	["amstin", "amstin", "--revision 1:38674", []]
]

combinations = [
	 [
	 	[
			 ["apigen", ""],
			["aterm", ""],
			["aterm-csharp", ""],
			["aterm-java", ""],
			["aterm-xml", ""],
			["balanced-binary-aterms", ""],
			["relational-aterms", ""],
			["shared-objects", ""],
			["shared-objects-csharp", ""],
		], "aterms"
	]
]

combinations.each { |repos, target| join_multiple(repos, target) }
