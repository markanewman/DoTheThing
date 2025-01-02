# Manual fork

GitHub will not let you have two or more forks of the same repo in an organization.
It is a safety feature.
With two repos in the same org, GitHub can not tell which repo is the more authoritive source of truth.  

This process will not let you use GitHub's GUI based merge features, but self management of the template tree is a price you may be willing to pay.

To play with fire anyway, do the following:

1. Create a **blank** repo in GitHub in the same org.
   Do not add a readme or init the repo in any way.
2. Open VS Code and clone the **new** repo.
3. Add the old repo as a remote.
4. Fetch the remote.
5. Merge the remote into local/main.
6. Push the repo back to GitHub.
7. Validate in GitHub the files are in the new repo.
   Also check the commit hashes, the tops of both should match. 
9. Close VS Code and delete the local repo.
10. Re-Open VS Code and re-clone the repo from GitHub.

```{ps1}
git remote add template https://github.com/{{org}}/{{repo}}.git
git fetch template
git merge template/main
git push
```
