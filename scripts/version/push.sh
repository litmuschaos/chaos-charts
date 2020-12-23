#!/bin/sh
setup_git() {
  git config --global user.email "litmusbotci@gmail.com"
  git config --global user.name "litmus[bot]"
}

commit_updated_changes() {
  git checkout master
  git status
  git add .
  git commit --message " $GITHUB_RUN_ID: version upgraded for chaos-charts"
  git status
}

setup_git
commit_updated_changes

