Various tools for maintaining an Arch Linux repository. Make sure to edit them to your liking; the variables are in the first few lines. All tools depend on [aurutils](https://aur.archlinux.org/packages/aurutils/) and [pacaur](https://aur.archlinux.org/packages/pacaur/).

- checkupdates.sh: Checks for, and if available, build updates for packages in the repository.
- importpkg.sh: Build a package from AUR and add it to the repository.
- reloadpkgs.sh: Reload the packages in the repo directory and rebuild the database. Can be used to add packages by dumping them in the directory.