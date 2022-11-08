# Network location manager for xbar

This is an [xbar](https://xbarapp.com/) plugin to manage and quickly switch network locations from the menu bar.

## Why?

Apple [removed the UI to manage network locations](https://www.macrumors.com/2022/08/12/apple-removes-network-locations-macos-ventura/) in macOS Ventura and made this feature a lot less accessible by doing so.

The underlying command-line tool `networksetup` however still exists, so I thought it's nice to have it accessible through an item in the menu bar.

I am aware that there's already an [official plugin](https://github.com/matryer/xbar-plugins/blob/main/Network/network-location.1h.sh), but I only learned about it only after I already hacked this one, and since it also supports adding and deleting new locations, I thought it might still be useful to someone.

It also works on previous versions of macOS (I tested on Monterey, but older versions probably also work)

## Installation

To use this plugin, you basically just have to copy the shell script into xbar's plugin directory. See the official [xbar plugin authoring documentation](https://github.com/matryer/xbar-plugins/blob/main/CONTRIBUTING.md) for more details. 

## Preferences

| Variable   | Description                                         | Default |
| ---------- | --------------------------------------------------- | ------- |
| VAR_SYMBOL | Will be displayed as a prefix to the selected location name | ᯤ       |

## Contributions

Contributions are welcome, just open an issue and/or make a PR!