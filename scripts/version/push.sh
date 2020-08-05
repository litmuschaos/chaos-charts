#!/bin/sh
setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
  git remote set-url origin  https://${GITHUB_TOKEN}@github.com/litmuschaos/community-charts.git > /dev/null 2>&1
}

commit_updated_changes() {
  git checkout v1.6.x
  git status
  git add .
  git commit --message " $TRAVIS_BUILD_NUMBER: version upgraded for chaos-charts"
  git status
}

upload_files() {
  git remote -v
  git push origin v1.6.x
}

setup_git
commit_updated_changes
upload_files
