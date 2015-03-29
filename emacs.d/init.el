;;; init.el --- My init.el
;;; Commentary:
;;
;;; Code:
(server-start)

					; Environmental variables
; Path
(setenv "PATH" (concat "/Users/noah/anaconda/bin" ":" "/usr/local/bin:/usr/texbin" ":" (getenv "PATH")))
	

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

(package-initialize)


; List of plugins
(setq my-plugins '(use-package evil-org evil-surround evil-leader
		     evil-nerd-commenter org cdlatex reftex
		     company yasnippet deft elpy python-cell
		     projectile flycheck helm-projectile magit
		     cython-mode monokai-theme leuven-theme
		     function-args))

;; ; Install list of plugins 
;; (dolist (plugin my-plugins)
;;       (unless (package-installed-p plugin) 
;; 	(package-install plugin)))

(require 'use-package)

; Remove superfluous mode line indicators
(defun hbin-remove-mm-lighter (mm)
  "Remove minor lighter from the mode line."
  (setcar (cdr (assq mm minor-mode-alist)) nil))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (progn

    (global-evil-leader-mode)
    (evil-mode '1)
    (global-evil-surround-mode 1)
    (add-hook 'prog-mode-hook 'hs-minor-mode)
    (add-hook 'prog-mode-hook 'linum-mode)
    (add-hook 'view-mode-hook 'evil-emacs-state)
    (setq-default evil-symbol-word-search 'symbol)

    (define-key evil-normal-state-map (kbd "") 'evil-toggle-fold)))

(use-package evil-leader
  :ensure t
  :config
  (progn
    (evil-leader/set-leader "<SPC>")
    (evil-leader/set-key 
      "hb" 'helm-bookmarks
      "ro" 'helm-occur
      "rr" 'rgrep
      "rg" 'helm-git-grep
      "u" 'universal-argument
      "ta" 'align-regexp
      "cc" 'compile
      "cr" 'recompile
      "ff" 'helm-find-files
      "fr" 'helm-recentf
      "bb" 'helm-mini
      "dd" 'deft
      "op" 'org-preview-latex-fragment
      "s"  'speedbar-get-focus
      "." 'eshell
      "gs" 'magit-status)))

    
  
(setq evilnc-hotkey-comment-operator "gc")
(require 'evil-nerd-commenter)

; window movement
(global-set-key (kbd "C-j") 'other-window)

(use-package yasnippet
  :ensure t
  :config
  (progn 
    (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
    (yas-global-mode t)))


(defun insert-or-company-files ()
  (interactive)
  (insert "/")
  (company-files))

(use-package company
  :ensure t
  :config
  (progn
    (global-company-mode)
    (define-key global-map (kbd "C-.") 'company-files)
    (global-set-key (kbd "<S-tab>") 'company-complete)
    (hbin-remove-mm-lighter 'company-mode)))



					; Python
(use-package elpy
  :ensure t
  :config
  (progn 
    (add-hook 'python-mode-hook 'elpy-mode)
    (elpy-use-ipython)
    ))



  
;; (use-package company-anaconda
;;   :config
;;   (progn
;;     (add-to-list 'company-backends 'company-anaconda)
;;     (add-hook 'python-mode-hook 'anaconda-mode)))

(use-package python-cell
  :ensure t
  :config
  (progn
    (add-hook 'python-mode-hook 'python-cell-mode)
    (hbin-remove-mm-lighter 'python-cell-mode)))



					; C/C++

(defun setup-c-langs ()
  (require 'cc-mode)
  (require 'semantic)


  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)

  (semantic-mode 1)

  (use-package function-args
    :ensure t
    :config
    (progn
      (fa-config-default))))

(setup-c-langs)

					; Make "_" part of word
(modify-syntax-entry ?_ "w" )

					; Global Stuff

(use-package flycheck
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook #'global-flycheck-mode)))

					; Interactive completion stuff

(use-package helm
  :ensure t
  :init
  (progn
    (require 'helm-config)
    )
  :config
  (progn
    (evil-leader/set-key "bs" 'helm-mini)
    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (evil-leader/set-key "h" 'helm-command-prefix)
    (helm-mode 1)
    (evil-leader/set-key "hb" 'helm-bookmarks)
    (hbin-remove-mm-lighter 'helm-mode)
    ))



(use-package imenu
  :ensure t
  :config
  (progn
    (evil-leader/set-key "bi" 'helm-imenu)))

(use-package projectile
  :ensure t
  :config
  (progn
    (projectile-global-mode 1)
    (hbin-remove-mm-lighter 'projectile-mode)
    (evil-leader/set-key
      "pf" 'helm-projectile
      "pg" 'helm-projectile-grep
      "pa" 'helm-projectile-ack
      "pp" 'projectile-switch-project)))


;;; Useful for used files
(use-package recentf
  :ensure t
  :config
  (progn
    (recentf-mode 1)
    (global-set-key "\C-x\ \C-r" 'recentf-open-files)))


(use-package deft
  :ensure t
  :config
  (progn
    (setq deft-extension "org")
    (setq deft-text-mode 'org-mode)
    (setq deft-directory "~/Dropbox/notes")
    (setq deft-use-filename-as-title t)
    (add-hook 'deft-mode-hook 'evil-emacs-state)))

(use-package org
  :ensure t
  :config
  (progn
    (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
    (add-hook 'org-mode-hook 'auto-fill-mode)
    ;; (add-hook 'org-mode-hook 'org-indent-mode)

    (org-babel-do-load-languages
     'org-babel-load-languages
     '((python . t)
       (sh . t)
       (R . t)))
    ))

					; LaTeX

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

; Remove superfluous mode line indicators
(defun hbin-remove-mm-lighter (mm)
  "Remove minor lighter from the mode line."
  (setcar (cdr (assq mm minor-mode-alist)) nil))

(hbin-remove-mm-lighter 'undo-tree-mode)
(hbin-remove-mm-lighter 'yas-minor-mode)


;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))

(provide 'init)
