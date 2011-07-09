# ~/.profile: executed by the command interpreter for login shells.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "~/bin" ] ; then
    PATH="${PATH}:~/bin"
fi
