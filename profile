# ~/.profile: executed by the command interpreter for login shells.

# the default umask is set in /etc/profile
umask 022

# /sbin for none root users
[ -d /sbin ]                 && PATH="/sbin:${PATH}"
[ -d /usr/sbin ]             && PATH="/usr/sbin:${PATH}"
[ -d /usr/local/sbin ]       && PATH="/usr/local/sbin:${PATH}"

# should be in system path, but isn't in Max OS X
[ -d /usr/local/bin ]        && PATH="/usr/local/bin:${PATH}"

# add local rubsgems
[ -d ~/.gem/ruby/2.1.0/bin ] && PATH="~/.gem/ruby/2.1.0/bin:${PATH}"

# set PATH so it includes user's private bin if it exists
[ -d ~/bin ]                 && PATH="~/bin:${PATH}"

# vim: filetype=sh textwidth=80
