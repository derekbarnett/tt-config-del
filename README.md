These are my tintin++ configs and will need a bit of editing
to be fully useful to anyone else. In particular, you will
need to edit tt.rc and change the directory paths as well as
the mud connection details in tt-connections.rc.

GENERAL SETUP:

I put these config files and the tturl script in ~/.tintin
and my log files in ~/logs/tt.log and ~/logs/tturl.log. If
you wish to use different pathnames, change the variables
referencing these locations in tt.rc.

tt.rc is the base config file which contains various variable
definitions and loads the other config files. tt-alias.rc and
tt-action.rc contain general aliases, actions and macros which
I commonly use. I keep my logging actions in tt-capture.rc.
Feel free to split your alias and actions any way you choose,
whether split by type (like i have done), split by mud or
just dumped into one big file. If you like, you can have your
individual mud aliases load mud specific config files by
adding:
#read configfile.rc;
into the alias definitions.

The short version of the steps to set this up like I have it:
git clone <whatever the address to this ends up being>
mkdir ~/.tintin
mkdir ~/logs
touch ~/logs/tt.log
touch ~/logs/tturl.log
cd <dir> - the directory created when you used git clone above
cp * ~/.tintin
launch tintin++ with: tintin ~/.tintin/tt.rc
open chat log in anohter terminal: tail -f ~/logs/tt.log

DETAILS ABOUT CAPTURE LOGGING:

I use tintin++ within tmux, which allows me to split my windows.
In a small split, I use 'tail -f ~/logs/tt.log' to see my chat
captures, while I run tintin++ itself in the larger window.
It works equally well to simply run tintin++ in one terminal
while tailing the tt.log file in another, and I have no doubt
that there are many other perfectly reasonable ways to view your
chat logs. Perhaps you would find it nice to pipe the output
to a widget or your task manager/bar in your favorite window
manager or using a quake-like dropdown terminal to tail your
chat logs.

This setup uses notify-send for desktop notifications of various
incoming messages and such, which will probably be installed by
default on any modern linux installations. If you don't want
to use them, simply delete the notify alias and remove the
references to it in the various rc files. Use the command
'which notify-send' to ensure you have this installed if you
wish to use it but aren't sure that you already have it.

Not all incoming chat types are set up to send desktop notifications.
My config uses notify-send mostly for channels I want or need to
pay close attention to. It's easy to modify the behaviour by
adding or removing 'notify' to each action in tt-capture.rc as desired.

It also uses a shell script, pullurl.sh, to pull urls from new
messages and then log them to a separate log file (tturl.log). There is
then an alias (/ff) which grabs the last url in the tturl.log file
and feeds it to xdg-open, which then opens that url in your default
web browser. Most modern linux distributions will install xdg-open
by default (at least if you did any sort of desktop install,)
but you can check 'which xdg-open' to see whether you have it
installed. If you don't wish to use this, remove the line:
'#system sh ~/.tintin/pullurl.sh' from the various action definitions
in tt-capture.rc.

