alias init "git init"
alias remote "git remote"
alias state "git status"
alias log "git log --oneline --graph --decorate"
alias push "git push"
alias pull "git pull"
alias add "git add"
alias add-all "add -A"
alias remove "git rm"
alias checkout "git checkout"
alias commit "git commit -m"
alias commit-all "git commit -am"
alias amend "git commit --amend --no-edit"
alias amend-all "amend -a"
alias amend-msg "amend -m"
alias amend-all-msg "amend -am"
alias branch "git branch"
alias clean "git clean -fd"
alias clean-preview "git celan -n"
alias clone "git clone"
alias reset "git reset"
alias tag "git tag"
alias version-tag "tag (date +%Y%m%d)"
alias flow "git flow"
alias flow-init "flow init -d"
alias feature "flow feature"
alias release "flow release"
alias hotfix "flow hotfix"
alias support "flow support"

function __is_inside_git_repo
	git rev-parse 2> /dev/null
end

function diff -d "git diff if under git repo, or normal diff if outside git diff"
	__is_inside_git_repo

	if [ $status -eq 0 ]
		sh -c "git diff $argv"
	else
		command diff $argv
	end
end

function remove-cached -d "remove specified file from git repo" --argument-names fn
	if test -n $fn
		remove --cached $fn
		remove $f
	else
		echo "syntax: remove-cached <filename.txt>"
	end
end

function remove-all-ext -d "remove all files with extension from git repo" --argument-names ext
	if test -n $ext
		for f in (find . -name "*.ext")
			remove-cached $f
		end

		echo "*.$ext" >> .gitignore
	else
		echo "syntax: remove-all-ext <ext>"
	end
end


