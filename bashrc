# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# import all generic shell configurations (and ignore the env subdirectory)
for cfg in $(( find ~/.shell/ -maxdepth 1 -type f )) do
	source $cfg
	if [ -f ${cfg}_local ]; then
		source ${cfg}_local
done

# import all bash specific configurations and allow for local configs
for cfg in ~/.bash/* do
	source $cfg
	if [ -f ${cfg}_local ]; then
		source ${cfg}_local
done

# load environment-specific commands
if [ -f ~/.shell/env/selector.sh ]; then
	source ~/.shell/env/selector.sh
fi
