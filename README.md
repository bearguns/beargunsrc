# Bearguns RC
## \*nix Configurations for the fashionable grizzly.

These configuration files represent my working towards a better, more refined,
reusable set of configurations for the programs I use on a daily basis. Players
include:

- [Fish - The friendly interactive shell](https://fishshell.com/)
- [Tmux - Terminal multiplexing superpowers](https://github.com/tmux/tmux/wiki)
- [NeoVim - Vim, but more Neo](https://neovim.io)
- [Ranger - Super rad file manager for the command line](https://ranger.github.io/)

## Using these files at your own risk
It's assumed that the only reasons you could have for cloning these files and 
using them on your own system would be:
- A: You are a total beginner, and have no idea what you're doing.
- B: You are a total expert, and know exactly what you're doing **OR**
- C: You are, in fact, me -- bearguns himself.

### Installation
Clone this repo somewhere sensible in your home directory:
`$ git clone git@github.com:bearguns/bearguns-rc`

Symlink the directory or directories you need into `~/.config` i.e:
```bash
$ cd ~
$ mkdir .config && cd .config
$ ln -s /path/to/bearguns-rc/fish
```

Alternatively, if you are in fact me -- bearguns himself, then simply clone
this entire repo _as_ your `.config` directory.
