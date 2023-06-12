# Nuke GIT

Get rid of **everything** in history, keeping only the HEAD

```{ps1}
git checkout --orphan nuke
git add -A
git commit -am "nuke"
git branch -D master
git branch -m master
git push -f origin master

git push origin --force --all
git push origin --force --tags
```
