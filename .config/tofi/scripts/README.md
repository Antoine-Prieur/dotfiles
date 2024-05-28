# Add custom desktop applications to tofi

To create a custom application to be executed using tofi-drun:
- in `~/.config/tofi/scripts/`, create a bash script executing any command
- make the script executable `chmod +x $file.sh`
- in `/usr/share/applications/`, create a file named `$file.desktop`, and write the following:
```
[Desktop Entry]
Name=$The name of the application
Comment=
Exec=/path/to/script.sh $arg1 ...
Icon=utilities-terminal
Terminal=false
Type=Application
```
- make the `.desktop` file executable with `chmod +x $file.desktop`


# error launching application: Unable to find terminal required for application 

If the script won't start with this error:
- `echo kitty.desktop >> $HOME/.config/xdg-terminals.list`
- `mkdir $HOME/.local/share/xdg-terminals/`
- `ln -s /usr/applications/kitty.desktop $HOME/.local/share/xdg-terminals/`
- to check if it's working, `xdg-terminal-exec` should start a kitty instance
