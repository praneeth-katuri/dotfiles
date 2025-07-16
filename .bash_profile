# Environment variables for wayland sessions
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
  export QT_QPA_PLATFORM="wayland;xcb"
  export MOZ_ENABLE_WAYLAND=1
fi

if [ "$XDG_CURRENT_DESKTOP" != "KDE" ]; then
  export QT_QPA_PLATFORMTHEME=qt5ct
  export _JAVA_AWT_WM_NONREPARENTING=1
fi

export ANDROID_HOME="$HOME/Android/Sdk"

export PATH="${PATH}:$HOME/.local/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator"

if [ -z "$SSH_AUTH_SOCK" ]; then
  export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
fi

# using `NVM` so commented it out
#export npm_config_prefix="$HOME/.local"

if [[ -f ~/.bashrc ]]; then
  . ~/.bashrc
fi
