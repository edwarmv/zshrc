# gruvbox-material
# ZVM_VI_HIGHLIGHT_FOREGROUND=#d4be98
# ZVM_VI_HIGHLIGHT_BACKGROUND=#504945

# tokyonight_storm
ZVM_VI_HIGHLIGHT_FOREGROUND=#c0caf5
ZVM_VI_HIGHLIGHT_BACKGROUND=#2e3c64

# REF https://github.com/junegunn/fzf-git.sh/pull/46/files
function zvm_after_init() {
  zvm_bindkey viins "^P" up-line-or-beginning-search
  zvm_bindkey viins "^N" down-line-or-beginning-search
  zvm_bindkey viins '^R' fzf-history-widget
  zvm_bindkey vicmd '^R' redo
  zvm_bindkey viins '\ec' fzf-cd-widget
  for o in files branches tags remotes hashes stashes lreflogs each_ref; do
    eval "zvm_bindkey viins '^g^${o[1]}' fzf-git-$o-widget"
    eval "zvm_bindkey viins '^g${o[1]}' fzf-git-$o-widget"
  done
}
# Set key bindings for zsh-vi-mode normal and visual modes.
function zvm_after_lazy_keybindings() {
  for o in files branches tags remotes hashes stashes lreflogs each_ref; do
    eval "zvm_bindkey vicmd '^g^${o[1]}' fzf-git-$o-widget"
    eval "zvm_bindkey vicmd '^g${o[1]}' fzf-git-$o-widget"
    eval "zvm_bindkey visual '^g^${o[1]}' fzf-git-$o-widget"
    eval "zvm_bindkey visual '^g${o[1]}' fzf-git-$o-widget"
  done
}
