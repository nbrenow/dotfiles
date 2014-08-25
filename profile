#    source the local profile first
if [[ -e $HOME/.profile.local ]]
then
    source $HOME/.profile.local 
fi

#######USER ALIASES########################

alias prox='ssh -YD 9999 ndb245@access.cims.nyu.edu'
alias webd="cd ~/Sites/"
alias ssh='ssh -Y'
alias mnt_helix='sshfs -o transform_symlinks,follow_symlinks helix: /Users/noah/shares/helix'
alias aria='aria2c -d $HOME/Desktop -j 4 -x 4 --load-cookies=$HOME/.cookies -Z'
alias fserve='aria2c -d $HOME/Downloads/Warez -j 4 -x 4 --load-cookies=$HOME/.cookies -Z'
alias ipy='ipython qtconsole --pylab=inline'

alias screen='screen -R'
alias p='pushd'
alias o='popd' 
alias d='dirs -v'

if [ $(uname) == "Darwin" ] 
then
    alias g='mvim --servername VIM1 --remote-silent'
    alias mlab='/Applications/MATLAB_R2013a.app/bin/matlab -nodesktop -nosplash'
    alias vim='mvim -v'

else
    alias g='gvim --servername VIM1 --remote-silent'
    alias mlab='matlab -nodisplay'
    #alias vim='vim -X'
fi
    

############################################################
#                  Colorscheme and Prettiness
############################################################

# This sets LS Colors differently for darwin and linux
if [ "$TERM" != "dumb" ]; then
 if [ $(uname) == "Linux"  ]; then
   # Linux
   alias ls='ls --color=auto'
   LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'
 else
   # OS X   
   alias ls='ls -G'
   export LSCOLORS=dxfxcxdxbxegedabagacad
 fi
 #This is for everyone       
 export CLICOLOR=1
fi

export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
#export PS1='[\[\033[01;32m\]\u\[\033[01;34m\] \W \[\033[00m\]]'
#export PS1='[\[\033[01;34m\]\W\[\033[0m\]] '

############################################################
#                  Environ Variable Set
############################################################
export PATH=/usr/local/texlive/2010/bin/x86_64-darwin:$HOME/bin:/usr/local/share/python:$PATH
export PATH=$HOME/usr/bin:$HOME/bin/nbconvert-master:$HOME/.cabal/bin:$PATH
export PATH=/opt/ncl_ncarg/bin:$PATH
export PATH=/Applications/Wine.app/Contents/Resources/bin/:$PATH
export PATH=$HOME/local/bin:$PATH
export PATH=/Applications/git-annex.app/Contents/MacOS:$PATH


export EDITOR='/usr/bin/env vim'
export NCARG_ROOT=/opt/ncl_ncarg
export PKG_CONFIG_PATH=/opt/X11/lib/pkgconfig:/usr/local/Library/ENV/pkgconfig/10.8:$PKG_CONFIG_PATH

export DOTFILES=$HOME/.dotfiles
export PATH=$DOTFILES/dotsync/bin:$PATH



export ETS_TOOLKIT=qt4

################Environment Variables########

if [[ $(uname) == 'Darwin' ]]
then
    source `brew --prefix`/Library/Contributions/brew_bash_completion.sh
    export PATH=/usr/local/bin:$PATH


    # VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/noah/Library/Enthought/Canopy_64bit/User/bin/activate

    # Setting PATH for EPD-7.3-2
    # The orginal version is saved in .bash_profile.pysave
    PATH="/Library/Frameworks/EPD64.framework/Versions/Current/bin:${PATH}"
    export PATH
    export PYTHONPATH=/Users/noah/proj/rayben
    alias pynb='cd ~/Dropbox/ipython-notebooks && tmux new "ipython notebook"'

    MKL_NUM_THREADS=1
    export MKL_NUM_THREADS
fi


function sw(){
mv "$2" .tmp123124125
mv "$1" "$2"
mv .tmp123124125 "$1"

}

function del() {
  while [ -n "$1" ]; do
    if [ ! -e "$1" ]; then
      echo "'$1' not found; exiting"
      return
    fi  

    local file=`basename -- "$1"`

    # Chop trailing '/' if there
    file=${file%/}

    local destination=''

    if [ -e "$HOME/.Trash/$file" ]; then
      # Extract file and extension
      local ext=`expr "$file" : ".*\(\.[^\.]*\)$"`
      local base=${file%$ext}

      # Add a space between base and timestamp
      test -n "$base" && base="$base "

      destination="/$base`date +%H-%M-%S`_$RANDOM$ext"
    fi  
    \mv -i -- "$1" "$HOME/.Trash$destination" || return
    shift
  done
}

pman() 
{ 
    man -t "$@" | open -f -a Preview; 
}


if [[ -e $HOME/.git-completion.bash ]]
then
    source $HOME/.git-completion.bash
fi

# added by Miniconda 3.5.5 installer
export PATH="/Users/noah/miniconda/bin:$PATH"

# added by Miniconda 3.5.5 installer
export PATH="/Users/noah/miniconda/bin:$PATH"

# added by Miniconda 3.5.5 installer
export PATH="/Users/noah/miniconda/bin:$PATH"

# added by Anaconda 2.0.1 installer
export PATH="/Users/noah/anaconda/bin:$PATH"
