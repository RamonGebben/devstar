#Cocky

#Cocky Ubuntu 64bits 12.04

### What is Cocky?
Cocky is an highly opinionated server configuration for all round web development. It lays focus on usability, shell scripting and workflow optimisation. 

Furter on will be descpribed how this set up comes into place. 
And some information on the different software that makes this IDE.


####Byobu Terminal Manager
[Byobu Website](http://byobu.co/)

Byobu is a GPLv3 open source text-based window manager and terminal multiplexer. It was originally designed to provide elegant enhancements to the otherwise functional, plain, practical GNU Screen, for the Ubuntu server distribution. 

Byobu now includes an enhanced profiles, convenient keybindings, configuration utilities, and toggle-able system status notifications for both the GNU Screen window manager and the more modern Tmux terminal multiplexer, and works on most Linux, BSD, and Mac distributions.


####Mosh | Mobile shell
[Mosh Website](http://mosh.mit.edu/)

Remote terminal application that allows roaming, supports intermittent connectivity, and provides intelligent local echo and line editing of user keystrokes.

Mosh is a replacement for SSH. It's more robust and responsive, especially over Wi-Fi, cellular, and long-distance links.

####Fish Shell
[Fish Website](http://fishshell.com/)

fish is a smart and user-friendly command line shell for OS X, Linux, and the rest of the family.

- Autosuggestions
 - fish suggests commands as you type based on history and completions, just like a web browser.

- Glorious VGA Color
 - fish natively supports term256, the state of the art in terminal technology. You'll have an astonishing 256 colors available for use!

- Sane Scripting
 - fish is fully scriptable, and its syntax is simple, clean, and consistent. You'll never write esac again.

- Web Based configuration
 - For those lucky few with a graphical computer, you can set your colors and view functions, variables, and history all from a web page.

- Man Page Completions
 - Other shells support programmable completions, but only fish generates them automatically by parsing your installed man pages.

- Works Out Of The Box
 - fish will delight you with features like tab completions and syntax highlighting that just work.

####Node JS
Node.js is a platform built on Chrome's JavaScript runtime for easily building fast, scalable network applications. Node.js uses an event-driven, non-blocking I/O model that makes it lightweight and efficient, perfect for data-intensive real-time applications that run across distributed devices.




###Setup
Create a VPS with Ubuntu 12.04 LTS
This is the choice because it will be supported untill 2017.

Enables at Digital Ocean

- VitrIO
- Back Ups

Sign into root at the server.

####Update
After you have created a VPS you will need to update it first.

    apt-get update && apt-get upgrade

Because the 12.04 doesn't support ppa's out of the box we must add the support, and add some ppa's.
 

    apt-get install -y python-software-properties
    add-apt-repository -y ppa:keithw/mosh #mosh
    add-apt-repository -y ppa:fish-shell/release-2  #fish
    apt-get update

Install all at onces.

     apt-get install -y mosh byobu fish 

The ` -y` is for "yes" when the console asks do you want to install.

####Install Mosh on your local machine

Use the repository from above, and 

    apt-get install mosh

####Make sure an intial language of English is selected
Make sure `/etc/defaults/locale` looks like this:

    root@dev:~# more /etc/default/locale
        LANG="en_US.UTF-8"
        LANGUAGE="en_US.UTF-8"
        LC_ALL="en_US.UTF-8"
        LC_BYOBU-1

####Setting default group.
A default group is required for option collaborative coding.

    addgroup cocky
    adduser <name> 
    usermod -g cocky <name>

####Giving group conky sudo right without password
Everybody who is in group cocky, will be able to use sudo without password.
This is accomplished by adding the group to `/etc/sudoers.d/cocky'

    %cocky ALL(ALL:ALL) PASSWD:ALL

Make sure the rights are according sudo's expectation.

    chmod 0440 /etc/sudoers.d/cocky

####Build default cocky directory 
The default directory is needed to store every cocky things.
This will become the collaborative folder with all the main development tools and scripts.

    mkdir /cocky
    mkdir /cocky/sites
    mkdir /cocky/tools
    mkdir /cocky/fish
    mkdir /cocky/config
    chown -r root:cocky /cocky /cocky/fish /cocky/sites /cocky/tools /cocky/config

And to get the fish functions folder in the cocky folder you must create a symlink for /cocky/fish

    ln -s /conky/fish /etc/fish/functions

Make sure that all the rights in the folder and subfolders are set to 775.

Here is a list of fish functions.

- fish_prompt 
 - This will give you an awesome prompt. Designed to look like a sfpt prompt.

####Default file premissions
To be able to make cocky the default group of every file and folder created you edit line 151 in `/etc/login.defs` where it saids `UMAKS    022` it should say `UMAKS   002`
The magical line for this is:

    sed -i 's/UMASK\s*022/UMASK 002/g'

####Set Default Shells
To be able to still connect with your server via mosh and ssh, you will need to first open byubo before excuting fish. This is because fish doesn't cooperate well with mosh or ssh.
To open fish as default shell in byobu you need to make `/etc/tmux.conf` looks like this 

    user@dev:/etc$ more /etc/tmux.conf
    set -g default-shell /usr/bin/fish
    set -g default-command /usr/bin/fish

Because byobu's default configuration it doesn't allow the sublime color settings of fish. It how ever does have the option to set 256 color scheme.
Because the workarround is a bit tricky we made it into a fish function.
Check fish functions for more info on this.

> Furter in progress
