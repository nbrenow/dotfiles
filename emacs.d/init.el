;;; init.el --- My init.el
;;; Commentary:
;;
;;; Code:
(server-start)


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


; Bootstrap Use-Package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
					; General

(setq config-list (list))

(defun config/general ()
  (add-hook 'prog-mode-hook 'electric-pair-mode)
  (modify-syntax-entry ?_ "w" )  ; Make "_" part of word
  )

(add-to-list 'config-list 'config/general)

					; Apearance


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
    ;; (add-hook 'prog-mode-hook 'linum-mode)
    (setq-default evil-symbol-word-search 'symbol)
    
    (setq evil-emacs-state-modes 
	  (append evil-emacs-state-modes 
		  '(view-mode TeX-output-mode view-mode
		    customize-mode)))

    (define-key evil-normal-state-map (kbd "") 'evil-toggle-fold)


    ;;; org-goto emacs mode from
    ;;; http://emacs.stackexchange.com/questions/883/using-evil-mode-with-a-function-that-does-not-work-well-with-evil-mode
    (defadvice org-goto (around make-it-evil activate)
      (let ((orig-state evil-state)
	    (evil-emacs-state-modes (cons 'org-mode evil-emacs-state-modes)))
	ad-do-it
	(evil-change-state orig-state)))

    ))

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


(use-package company
  :ensure t
  :config
  (progn
    (global-company-mode)
    (define-key global-map (kbd "C-.") 'company-files)
    (global-set-key (kbd "<C-tab>") 'company-complete)
    (hbin-remove-mm-lighter 'company-mode)))


					; Tags browsing

(use-package ggtags
  :ensure t
  :config
  (progn
    (defun fix-keybindings ()
      (define-key evil-normal-state-map (kbd "C-]") 'ggtags-find-tag-dwim))
    (add-hook 'ggtags-mode-hook 'fix-keybindings)
    ))

					; Fortran

(use-package evil-matchit
  :ensure t
  :config (progn
	    (global-evil-matchit-mode 1)))


					; Matlab


(defun config-cims ()
  (add-to-list 'load-path "~/.emacs.d/matlab-emacs")
  (require 'matlab-load))

(when (string-match "cims.nyu.edu$" system-name) (config-cims))
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

  (use-package c-eldoc
    :ensure t
    :config
    (progn
      (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)))

  (use-package function-args
    :ensure t
    :config
    (progn
      (fa-config-default))))

(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
(setup-c-langs)
					

					; Global Stuff

(use-package flycheck
  :ensure t
  :config
  (progn
    (add-hook 'after-init-hook #'global-flycheck-mode)))

					; Interactive completion stuff

(use-package helm
  :ensure t
  :config
  (progn

    (require 'helm)
    (require 'helm-config)


;; Some keybindings
    
    (evil-leader/set-key "bs" 'helm-mini)
    (global-set-key (kbd "C-x b") 'helm-mini)
    (global-set-key (kbd "M-x") 'helm-M-x)
    (evil-leader/set-key "h" 'helm-command-prefix)
    (helm-mode 1)
    (evil-leader/set-key "hb" 'helm-bookmarks)
    (hbin-remove-mm-lighter 'helm-mode)
    ))

;; in helm-find-files enter directory with enter
(defun fu/helm-find-files-navigate-forward (orig-fun &rest args)
  (if (file-directory-p (helm-get-selection))
      (apply orig-fun args)
    (helm-maybe-exit-minibuffer)))


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

(setq org-use-speed-commands t)
(use-package org
  :ensure t
  :init
  :config
  (progn
    (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
    (add-hook 'org-mode-hook 'auto-fill-mode)

    (org-babel-do-load-languages
     'org-babel-load-languages
     '((python . t)
       (sh . t)
       (R . t))))
  :bind ("C-c a" . org-agenda))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

					; LaTeX
(defun config/latex  ()
  (setq org-latex-pdf-process (quote  ( "latexmk -pdf %f" )))

;;; To enable synctex just make a latexmkrc file that contains:
;;;
;;; $ cat ~/.latexmkrc
;;; $pdflatex='pdflatex -line-error  -synctex=1'

  (use-package company-auctex
    :ensure t)

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
  )

(add-to-list 'config-list 'config/latex)

;;; Use this function to fill lines on sentence breaks.
(defun fill-sentence ()
  (interactive)
  (save-excursion
    (or (eq (point) (point-max)) (forward-char))
    (forward-sentence -1)
    (indent-relative t)
    (let ((beg (point))
          (ix (string-match "LaTeX" mode-name)))
      (forward-sentence)
      (if (and ix (equal "LaTeX" (substring mode-name ix)))
          (LaTeX-fill-region-as-paragraph beg (point))
        (fill-region-as-paragraph beg (point))))))

;;; Key binding for the above function
(global-set-key (kbd "M-j") 'fill-sentence)


;; Execute all functions
(mapcar 'funcall  config-list)

(provide 'init)
