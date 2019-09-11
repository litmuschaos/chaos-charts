#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git remote set-url origin  https://${GITHUB_TOKEN}@github.com/rajdas98/community-charts.git > /dev/null 2>&1
}

commit_website_files() {
  git checkout master
  git status
  git add .
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
  git status
}

upload_files() {
  git remote -v
  git push origin master
}

setup_git
commit_website_files
upload_files
