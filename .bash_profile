# Environment variables for wayland sessions
if [ "$XDG_SESSION_TYPE" = "wayland" ] ; then
    export QT_QPA_PLATFORM="wayland;xcb"
    export MOZ_ENABLE_WAYLAND=1
fi

if [ "$XDG_CURRENT_DESKTOP" != "KDE" ] ; then
    export QT_QPA_PLATFORMTHEME=qt6ct
    export _JAVA_AWT_WM_NONREPARENTING=1
fi

export SSH_ASKPASS=/usr/bin/ksshaskpass
export SSH_ASKPASS_REQUIRE=prefer

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="${PATH}:$HOME/.local/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

# using `NVM` so commented it out
#export npm_config_prefix="$HOME/.local"

if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi
