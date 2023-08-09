#!/usr/bin/env nu

def main [] {
  # This directory contains all my forks of opensource repositories.
  cd ~/code/opensource

  ls | get name | each { |dir| 
    cd $dir

    let default_branch = (git symbolic-ref refs/remotes/origin/HEAD | sed 's@^refs/remotes/origin/@@')

    git fetch upstream
    
    if (git branch --show-current) != $default_branch {
      git checkout $default_branch
    }

    if (git rebase $"upstream/($default_branch)") =~ 'up to date' {
      echo $"($default_branch) for ($dir) is already up to date"
    } else {
      git push
    }
  }
}