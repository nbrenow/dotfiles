;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                                     auto-completion-return-key-behavior 'complete
                                     auto-completion-tab-key-behavior 'cycle
                                     auto-completion-complete-with-key-sequence "ii"
                                     auto-completion-complete-with-key-sequence-delay 0.1)
     evil-snipe ;; two character motions using s/S
     docker
     ;; better-defaults
     ;; ivy
     emacs-lisp
     git
     ;; (git :variables
     ;;      git-gutter-use-fringe t)
     ;; markdown
     ;; github
     org
     bibtex
     (latex :variables latex-enable-folding t latex-enable-auto-fill t)
     ;; html
     ;; javascript
     (shell :variables shell-default-term-shell "/bin/bash")
     syntax-checking
     (python :variables python-test-runner 'pytest)
     ;; ess
     ;; clojure
     ;; go
     ;; semantic
     ;;(c-c++
     nginx
     ;; )
     (version-control :variables
                      version-control-diff-tool 'diff-hl)
     ;; deft ;; notational velocity clone
     markdown
     ;; pandoc
     dash ;; documentation browser (I spent $$$ on this)
     ;; tmux  ;; adds navigation between tmux and emacs panes
     ;; vim-powerline
     chrome
     shell-scripts
     ;; My layers
     ;; julia
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      ;; major-file modes
                                      snakemake-mode
                                      yaml-mode
                                      ob-ipython
                                      toml-mode
                                      ncl-mode
                                      ;; writing
                                      deft
                                      ;; cdlatex
                                      helm-bibtex
                                      ;; Extras
                                      dash-at-point ; for dash browser
                                      ;; Themes
                                      ;; warm-night-theme
                                      writeroom-mode
                                      osx-pseudo-daemon
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default nil)
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(misterioso
                         warm-night
                         spacemacs-light
                         zenburn
                         spacemacs-dark
                         leuven
                         monokai)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Meslo LG M for Powerline"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; dotspacemacs-default-font '("Monaco"
   ;;                             :size 12
   ;;                             :weight normal
   ;;                             :width normal
   ;;                             :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; make spacemacs compatible with conda environments
  ;; https://emacs.stackexchange.com/questions/32103/spacemacs-use-anaconda-environment
  (setenv "WORKON_HOME" "/Users/noah/anaconda/envs")

  ;; turn off whitespace
  ;; (use-package edit-server
  ;;   :if window-system
  ;;   :init
  ;;   (add-hook 'after-init-hook 'edit-server-start t))
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;; turn off ugly text wrapping arrows
  (global-visual-line-mode 1)

  ;; turn off line highlighting
  (global-hl-line-mode -1)

  ;; turn off line number
  (global-linum-mode -1)

  ;; Enable evil-matchit for all buffers
  (global-evil-matchit-mode)

  ;; Follow symlinks automatically
  (setq vc-follow-symlinks t)

  ;; slow scrolling
  (setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time

  ;; Turn on auto fill mode
  (spacemacs/toggle-auto-fill-mode-on)

  ;; Change autosave interval
  (setq auto-save-timeout 30)

  ;; Turn off savehist mode
  (savehist-mode 0)

  ;; abbreviations
  (setq abbrev-file-name (concat dotspacemacs-directory "abbrev_def"))
  (read-abbrev-file abbrev-file-name)

  ;; hungry delete
  (spacemacs/toggle-hungry-delete-on)

  ;; bash shell
  ;; fish shell is too fancy for emacs
  (setq-default explicit-shell-file-name "/bin/bash")
  (setq-default shell-file-name "/bin/bash")

  ;; C++

  ;; deft-options
  (evil-set-initial-state 'deft-mode 'emacs)
  (use-package deft
    :init
    (progn
      (setq deft-default-extension "org")
      (setq deft-text-mode 'org-mode)
      (setq deft-directory "~/Dropbox/notes")
      (setq deft-use-filter-string-for-filename  t)))


  ;; Paredit bindings
  (dolist (lang-map '(emacs-lisp-mode-map))
    (progn
      (evil-define-key 'normal emacs-lisp-mode-map
        (sp-use-smartparens-bindings)
        "-" 'sp-backward-sexp
        ;; "=" 'sp-next-sexp
        "_" 'sp-backward-up-sexp
        "+" 'sp-down-sexp)))

  ;; Use variable width font faces in current buffer
  (defun my-buffer-face-mode-variable ()
    "Set font to a variable width (proportional) fonts in current buffer"
    (interactive)
    (setq buffer-face-mode-face '(:family "Times New Roman" :height 150))
    (buffer-face-mode))

  ;; Use monospaced font faces in current buffer
  (defun my-buffer-face-mode-fixed ()
    "Sets a fixed width (monospace) font in current buffer"
    (interactive)
    (setq buffer-face-mode-face '(:family "Monaco" :height 120))
    (buffer-face-mode))


  ;; Set default font faces for Info and ERC modes
  ;; (add-hook 'org-mode-hook 'my-buffer-face-mode-variable)

  ;; (add-hook 'LaTeX-mode-hook 'turn-off-smartparens-mode)
  ;; (add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)
  ;;; Latex settings

  ;; (add-hook 'LaTeX-mode-hook 'my-buffer-face-mode-variable)
  (add-hook 'Info-mode-hook 'my-buffer-face-mode-variable)

  ;;; Sentence based filling in Latex modes
  ;; http://stackoverflow.com/questions/539984/how-do-i-get-emacs-to-fill-sentences-but-not-paragraphs
  (defun auto-fill-by-sentences ()
    (if (looking-back (sentence-end))
        ;; Break at a sentence
        (progn
          (LaTeX-newline)
          t)
      ;; Fall back to the default
      (do-auto-fill)))
  (add-hook 'LaTeX-mode-hook (lambda () (setq auto-fill-function 'auto-fill-by-sentences)))

  ;; Modified from http://pleasefindattached.blogspot.com/2011/12/emacsauctex-sentence-fill-greatly.html
  (defadvice LaTeX-fill-region-as-paragraph (around LaTeX-sentence-filling)
    "Start each sentence on a new line."
    (let ((from (ad-get-arg 0))
          (to-marker (set-marker (make-marker) (ad-get-arg 1)))
          tmp-end)
      (while (< from (marker-position to-marker))
        (forward-sentence)
        ;; might have gone beyond to-marker---use whichever is smaller:
        (ad-set-arg 1 (setq tmp-end (min (point) (marker-position to-marker))))
        ad-do-it
        (ad-set-arg 0 (setq from (point)))
        (unless (or (looking-back "^\\s *")
                    (looking-at "\\s *$"))
          (LaTeX-newline)))
      (set-marker to-marker nil)))
  (ad-activate 'LaTeX-fill-region-as-paragraph)

  ;; Electric period key
  ;; (defun period-and-newline ()
  ;;   (interactive)
  ;;   (insert-string ".")
  ;;   (newline-and-indent))

  ;; (evil-define-key 'insert LaTeX-mode-map (kbd ".") 'period-and-newline)

  ;; evil-motions for selecting the current environment

  (defun kill-beamer-frame ()
    (interactive)
    (re-search-backward "\\\\begin{frame}")
    (push-mark)
    (search-forward-regexp "\\\\end{frame}")
    (evil-visual-select (mark) (point)))

  (evil-define-text-object evil-a-latex-frame (count &optional beg end type)
    "Select inner angle bracket."
    :extend-selection t
    (kill-beamer-frame))

  (defun narrow-to-env ()
    ;; Narrow to current latex environment
    (interactive)
    (LaTeX-mark-environment)
    (narrow-to-region (region-beginning) (region-end))
    (deactivate-mark))

  (defun latex-read-inputs ()
    ;; Read all \input files in a latex file and comment out \input command
    (interactive)
    (push-mark)
    (goto-char 0)
    (while (re-search-forward "^ *\\\\input{\\(.*?\\)}" nil t)
      (let ((input-file (match-string 1)))
        (message (concat "Reading file " input-file " into current buffer and commenting input command"))
        (forward-line)
        (comment-line -1)
        (evil-read nil input-file)))
    (pop-mark))

  (define-key evil-outer-text-objects-map "f" 'evil-a-latex-frame)
  (spacemacs/set-leader-keys-for-major-mode 'latex-mode
    "ne" 'narrow-to-env)

  ;; Ask for latex master file
  (setq-default TeX-master nil)


  ;;; Handy key-bindings

  ;; j and k go down visual lines
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  (global-set-key (kbd "M-s M-s") 'save-buffer)

  ;; browse url at point
  (evil-leader/set-key "ou" 'browse-url-at-point)


  ;;; Authoring tools

  ;; Bibliography management
  (use-package org-ref
    :config
    (progn
      (setq reftex-default-bibliography '("~/Dropbox/Papers/zotero.bib"))

      ;; see org-ref for use of these variables
      (setq org-ref-bibliography-notes "~/Dropbox/Papers/notes.org"
            org-ref-default-bibliography '("~/Dropbox/Papers/zotero.bib")
            org-ref-pdf-directory "~/Dropbox/Documents/org-ref/bibtex-pdfs/")

      ;; need to setup helm-bibtex as well
      (setq helm-bibtex-bibliography "~/Dropbox/Papers/zotero.bib")))

  ;; latex shortcuts
  ;; (use-package cdlatex)

  (defun my-org-config ()
    ;; org mode
    (add-hook 'org-mode-hook 'auto-fill-mode)
    ;; (add-hook 'org-mode-hook 'turn-on-org-cdlatex)

    (setq org-capture-templates
          '(("m" "Personal todo" entry (file+headline "~/Dropbox/notes/Personal.org" "Inbox")
             "* TODO %?\nEntered on %U\n  %i\n  %a")
            ("w" "Work todo" entry (file+headline "~/Dropbox/notes/Admin.org" "Inbox")
             "* TODO %?\nEntered on %U\n  %i\n  %a")
            ("h" "Howto" entry (file+headline "~/Dropbox/notes/Howto.org" "Inbox")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("i" "Idea" entry (file+headline "~/Dropbox/notes/Ideas.org" "Ideas")
             "* %?\nEntered on %U\n  %i\n  %a")
            ("c" "Meeting" entry (file+headline "~/Dropbox/notes/Admin.org" "Meetings")
             "* %?\n\n")))

    ;; (if (string-equal system-type "gnu/linux")
    ;;    (add-to-list 'org-file-apps '(t . "xdg-open %s")))


    (require 'ob-dot)
    (require 'ox-md) ;; needed for org markdown export
    (require 'ob-ipython)
    ;; (require 'ob-ipython)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '( (perl . t)
        (dot . t)
        (shell . t)
        ;; (R . t)
        (gnuplot . t)
        (clojure . t)
        ;;    (graphviz . t)
        (lisp . t)
        ;;    (stan . t)
        (org . t)
        (screen . t)
        (calc . t)
        (js . t)
        (latex . t)
        (plantuml . t)
        (ruby . t)
        (sh . t)
        (ipython . t)
        (python . t)
        (emacs-lisp . t)
        (ditaa . t)
        (awk . t)
        (octave . t)
        (sed . t)
        (sql . t)
        (sqlite . t)
        ))
    )

  (my-org-config)

  ;; Remove evil mode for org-goto
  (defadvice org-goto (around make-it-evil activate)
    (let ((orig-state evil-state)
          (evil-emacs-state-modes (cons 'org-mode evil-emacs-state-modes)))
      ad-do-it
      (evil-change-state orig-state)))


  ;; Fortran
  (add-to-list 'auto-mode-alist '("\\.F\\'" . f90-mode))


  ;; Flycheck can be really pedantic with many stupid error codes. The following
  ;; configuration file goes in ~/.config/flake8 and disables many of the stupid
  ;; warnings.
  ;;
  ;; [flake8]
  ;; ignore = E221,E501,E203,E202,E272,E251,E211,E222,E701,E303,E225,E226,E231
  ;; max-line-length = 160
  ;; exclude = tests/*
  ;; max-complexity = 10



  ;;; my own functions
  (defun remove-blank-spaces ()
    ;; Remove annoying trailing spaces
    (interactive)
    (beginning-of-buffer)  ;; This adds mark at beginning of buffer
    (replace-regexp " +$" "")
    (pop-global-mark))

  (defun noah-add-to-config ()
    ;; Add current file to config using the con alias
    (interactive)
    (shell-command
     (concat "con add " (buffer-file-name)))
    (message "Adding current file to dotfiles"))

  (defun craigslist-org ()
    ;; pull info from craigslist page into org-mode header
    (interactive)
    (let ((url (read-string "Enter Craigslist URL: ")))
      (org-insert-heading-respect-content)
      (insert
       (shell-command-to-string (concat "craigslist2org.py -n 0 " url)))))

  (evil-leader/set-key "oc" 'craigslist-org)

  (evil-leader/set-key
    "ors" 'remove-blank-spaces
    "orc" 'noah-add-to-config
    "ow" 'writeroom-mode
    ;; "oc" 'customize-group
    "oo" 'helm-occur
    "od" 'deft
    "oi" 'ibuffer)

  ;; auto-completion
  (global-company-mode)
  (define-key evil-emacs-state-map (kbd "C-.") 'company-files)
  (define-key evil-insert-state-map (kbd "C-f") 'company-files)
 ;; (define-key global-map (kbd "<C-tab>") 'company-complete)
 ;; (global-set-key (kbd "<C-,>") 'company-clang)
 ;; (evil-define-key 'insert c++-mode-map (kbd "C-c ,") 'company-clang)


  ;; Window navivation (conflicts with key bindings)
  ;; (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
  ;; (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
  ;; (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
  ;; (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

  ;; buffer navigation
  (define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)
  (global-set-key (kbd "C-x <C-left>") 'spacemacs/previous-useful-buffer)
  (global-set-key (kbd "C-x <C-right>") 'spacemacs/next-useful-buffer)

  ;; Window maximization
  ;; disabled because it is annoying on my work desktop
  ;; (add-to-list 'default-frame-alist '(fullscreen . fullheight))
  ;; (add-to-list 'default-frame-alist '(fullscreen-restore . fullheight))

  ;; Insert mode navigation
  (define-key evil-insert-state-map (kbd "<M-backspace>") 'evil-delete-backward-word)
  (define-key evil-insert-state-map (kbd "S-<left>") 'evil-backward-WORD-begin)
  (define-key evil-insert-state-map (kbd "S-<right>") 'evil-forward-WORD-begin)

  ;; mac os stuff
  (if (eq system-type 'darwin)
      (progn

        ;; skim for synctex
        (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
        (setq TeX-view-program-list
              '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


        (define-key global-map (kbd "s-w") 'spacemacs/frame-killer)
        (defadvice handle-delete-frame (around my-handle-delete-frame-advice activate)
          "Hide Emacs instead of closing the last frame"
          (let ((frame   (posn-window (event-start event)))
                (numfrs  (length (frame-list))))
            (if (> numfrs 1)
                ad-do-it
              (do-applescript "tell application \"System Events\" to tell process \"Emacs\" to set visible to false"))))))

  ;; kill ring forward binding
  (global-set-key "\M-Y" 'evil-paste-pop-next)

  ;; add spacemacs.d/snippets to yas snippet dirs
  (setq yas-snippet-dirs
        (cons (concat dotspacemacs-directory "snippets") yas-snippet-dirs))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace nil)
 '(abbrev-file-name "/home/noah/.spacemacs.d/abbrev_def")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("ab0950f92dc5e6b667276888cb0cdbc35fd1c16f667170a62c15bd3ed5ae5c5a" default)))
 '(deft-use-filename-as-title t)
 '(ess-eval-visibly nil)
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-clang-language-standard "c++11")
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/Dropbox/notes/Apartment Search.org" "~/Dropbox/dissertation/phd.org" "~/Dropbox/jobs/nsf/src/project.org" "~/Dropbox/notes/Jobs.org" "~/Dropbox/notes/Admin.org")))
 '(org-directory "~/Dropbox/notes")
 '(org-latex-classes
   (quote
    (("beamer" "\\documentclass[presentation]{beamer}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("article" "\\documentclass[12pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(org-ref-pdf-directory "~/Dropbox/Papers/bibtex-pdfs/")
 '(package-selected-packages
   (quote
    (dockerfile-mode docker tablist docker-tramp nginx-mode gmail-message-mode ham-mode html-to-markdown edit-server toml-mode writeroom-mode visual-fill-column zenburn-theme reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc helm-css-scss haml-mode emmet-mode company-web web-completion-data company-tern tern coffee-mode magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito ht evil-snipe outshine pp-c-l helm-pages ein wgrep smex ivy-hydra counsel-projectile counsel-dash counsel swiper osx-pseudo-daemon warm-night-theme-theme warm-night-theme color-theme-sanityinc-tomorrow-theme irony-eldoc flycheck-irony company-irony irony stickyfunc-enhance srefactor git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter vagrant-tramp vagrant helm-gtags ggtags pythonic package-build hide-comnt evil-unimpaired highlight dumb-jump yapfify py-isort org-projectile pcache org git-link pos-tip ctable diminish bind-map bind-key packed spinner key-chord log4e gntp dash-functional parent-mode parsebib gitignore-mode pkg-info epl flx goto-chg eval-sexp-fu powerline ivy alert markdown-mode hydra projectile helm-bibtex magit magit-popup git-commit with-editor iedit biblio biblio-core anaconda-mode auto-complete auctex yasnippet ess julia-mode anzu smartparens vimish-fold evil undo-tree flycheck company request helm helm-core popup async avy f dash s sublimity auctex-latexmk yaml-mode xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline solarized-theme snakemake-mode smeargle shell-pop restart-emacs rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-yapf popwin pip-requirements persp-mode pcre2el paradox orgit org-repo-todo org-ref org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-ipython noflet neotree ncl-mode multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-vimish-fold evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view eshell-z eshell-prompt-extras esh-help ensime elisp-slime-nav disaster diff-hl deft define-word dash-at-point cython-mode company-statistics company-quickhelp company-c-headers company-auctex company-anaconda column-enforce-mode cmake-mode clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu cdlatex buffer-move auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-globally-ignored-file-suffixes
   (quote
    (".build" ".o" ".png" ".pdf" ".mod" ".bin" ".nc" ".aux" ".db" ".cmake" ".pickle" ".pkl" ".ind" ".toc" ".npz" ".pyc")))
 '(projectile-globally-ignored-files (quote ("TAGS" "*CMakeFiles/*")))
 '(reftex-section-levels
   (quote
    (("part" . 0)
     ("chapter" . 1)
     ("section" . 2)
     ("subsection" . 3)
     ("subsubsection" . 4)
     ("paragraph" . 5)
     ("subparagraph" . 6)
     ("frametitle" . 7)
     ("addchap" . -1)
     ("addsec" . -2))))
 '(reftex-toc-split-windows-fraction 0.5)
 '(safe-local-variable-values
   (quote
    ((tex-main-file . talk)
     (TeX-master . talk)
     (tex-main-file . talk\.tex)
     (tex-main-file . main\.tex)
     (magit-git-executable . con)
     (TeX-master . talk\.tex)
     (TeX-master . main\.tex)
     (TeX-command-extra-options . "-shell-escape"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visual-line-fringe-indicators (quote (nil nil)))
 '(word-wrap t)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"])
 '(yas-snippet-dirs
   (quote
    ("/Users/noah/.spacemacs.d/snippets" "/Users/noah/.emacs.d/private/snippets/" yas-installed-snippets-dir "/Users/noah/.emacs.d/layers/+completion/auto-completion/local/snippets"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-electric-left-right-brace nil)
 '(abbrev-file-name "/home/noah/.spacemacs.d/abbrev_def")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#0a0814" "#f2241f" "#67b11d" "#b1951d" "#4f97d7" "#a31db1" "#28def0" "#b2b2b2"])
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("ab0950f92dc5e6b667276888cb0cdbc35fd1c16f667170a62c15bd3ed5ae5c5a" default)))
 '(deft-use-filename-as-title t)
 '(ess-eval-visibly nil)
 '(evil-search-module (quote evil-search))
 '(evil-want-Y-yank-to-eol nil)
 '(flycheck-clang-language-standard "c++11")
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(org-agenda-files
   (quote
    ("~/Dropbox/notes/Apartment Search.org" "~/Dropbox/dissertation/phd.org" "~/Dropbox/jobs/nsf/src/project.org" "~/Dropbox/notes/Jobs.org" "~/Dropbox/notes/Admin.org")))
 '(org-directory "~/Dropbox/notes")
 '(org-latex-classes
   (quote
    (("beamer" "\\documentclass[presentation]{beamer}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("article" "\\documentclass[12pt]{article}"
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
      ("\\paragraph{%s}" . "\\paragraph*{%s}")
      ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
     ("report" "\\documentclass[11pt]{report}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
     ("book" "\\documentclass[11pt]{book}"
      ("\\part{%s}" . "\\part*{%s}")
      ("\\chapter{%s}" . "\\chapter*{%s}")
      ("\\section{%s}" . "\\section*{%s}")
      ("\\subsection{%s}" . "\\subsection*{%s}")
      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))
 '(org-ref-pdf-directory "~/Dropbox/Papers/bibtex-pdfs/")
 '(package-selected-packages
   (quote
    (insert-shebang flycheck-bashate fish-mode company-shell winum pdf-tools tablist org-category-capture fuzzy flymd gmail-message-mode ham-mode html-to-markdown edit-server toml-mode writeroom-mode visual-fill-column zenburn-theme reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc helm-css-scss haml-mode emmet-mode company-web web-completion-data company-tern tern coffee-mode magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito ht evil-snipe outshine pp-c-l helm-pages ein wgrep smex ivy-hydra counsel-projectile counsel-dash counsel swiper osx-pseudo-daemon warm-night-theme-theme warm-night-theme color-theme-sanityinc-tomorrow-theme irony-eldoc flycheck-irony company-irony irony stickyfunc-enhance srefactor git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter vagrant-tramp vagrant helm-gtags ggtags pythonic package-build hide-comnt evil-unimpaired highlight dumb-jump yapfify py-isort org-projectile pcache org git-link pos-tip ctable diminish bind-map bind-key packed spinner key-chord log4e gntp dash-functional parent-mode parsebib gitignore-mode pkg-info epl flx goto-chg eval-sexp-fu powerline ivy alert markdown-mode hydra projectile helm-bibtex magit magit-popup git-commit with-editor iedit biblio biblio-core anaconda-mode auto-complete auctex yasnippet ess julia-mode anzu smartparens vimish-fold evil undo-tree flycheck company request helm helm-core popup async avy f dash s sublimity auctex-latexmk yaml-mode xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline solarized-theme snakemake-mode smeargle shell-pop restart-emacs rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-yapf popwin pip-requirements persp-mode pcre2el paradox orgit org-repo-todo org-ref org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file ob-ipython noflet neotree ncl-mode multi-term move-text monokai-theme mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum live-py-mode linum-relative link-hint info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-vimish-fold evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu ess-smart-equals ess-R-object-popup ess-R-data-view eshell-z eshell-prompt-extras esh-help ensime elisp-slime-nav disaster diff-hl deft define-word dash-at-point cython-mode company-statistics company-quickhelp company-c-headers company-auctex company-anaconda column-enforce-mode cmake-mode clojure-snippets clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu cdlatex buffer-move auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-globally-ignored-file-suffixes
   (quote
    (".build" ".o" ".png" ".pdf" ".mod" ".bin" ".nc" ".aux" ".db" ".cmake" ".pickle" ".pkl" ".ind" ".toc" ".npz" ".pyc")))
 '(projectile-globally-ignored-files (quote ("TAGS" "*CMakeFiles/*")))
 '(reftex-section-levels
   (quote
    (("part" . 0)
     ("chapter" . 1)
     ("section" . 2)
     ("subsection" . 3)
     ("subsubsection" . 4)
     ("paragraph" . 5)
     ("subparagraph" . 6)
     ("frametitle" . 7)
     ("addchap" . -1)
     ("addsec" . -2))))
 '(reftex-toc-split-windows-fraction 0.5)
 '(safe-local-variable-values
   (quote
    ((tex-main-file . talk)
     (TeX-master . talk)
     (tex-main-file . talk\.tex)
     (tex-main-file . main\.tex)
     (magit-git-executable . con)
     (TeX-master . talk\.tex)
     (TeX-master . main\.tex)
     (TeX-command-extra-options . "-shell-escape"))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visual-line-fringe-indicators (quote (nil nil)))
 '(word-wrap t)
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
)
