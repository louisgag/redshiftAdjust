# redshiftAdjust

This script allows manually adjusting the brightness and temperature of the screen directly from the commandline and without using the geographical position.
I've created it to be able to bind keyboard shortcuts to quickly increase/decrease brightness/temperature.

You can save the script and the two .dat files in a directory and run (or set your keyboards shortcuts) as follows:

`./adjScreen.sh bUp`
`./adjScreen.sh bDown`

to respectively increase and decrease brightness,

and

`./adjScreen.sh gUp`
`./adjScreen.sh gDown`

to respectively increase and decrease temperature.

Do not forget to allow executing the script (`chmod +x ./adjScreen.sh`) and give the full path when setting a keyboard shortcut.

Notes:

- [Redshift](https://github.com/jonls/redshift) and [bc](https://www.gnu.org/software/bc/) must be installed.
- The auto-ajust function of Redshift must not be enabled.
- On Gnome-based systems such as Ubuntu you may want to disable auto adjustment of brightness, because it may periodically reset your brightness even if your monitor does not support it. You can do it with this command: `gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false`.
- If despite disabling auto-adjusting the brightness and gamma your system still does it you can also setup another keyboard shortcut to recall your last settings by running adjScreen.sh without arguments.

