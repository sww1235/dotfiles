# dotfiles
my dotfiles

remember to clone with `--recurse-submodules -j8` to download vim packages. If
you forget then run `git submodule update --init --recursive` to bring in the
submodules or update them.


## NOTES

nvidia directory is copied from https://github.com/TheEdward162/dotfiles
so I can get nvidia cards working in void linux

## VIM specifics

use `.vim/after/` directory to not override defaults for things like filetype plugins etc

## SHELL specifics

`.bash_profile` is not used, and moved if detected.

All login shell configuration is  in `.profile` (or equivalent file for `zsh`)

All interactive shell configuration is in `.rc` files under the nominative directory of the shell.

General flow of file sourcing is as follows:

- `.profile`
	- `.bashrc`
		- `.aliases.sh`
			- `aliases-*.sh`
			- `exports-*.sh`
	- other shell specific `rc` file
