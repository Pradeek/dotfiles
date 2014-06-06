;;; package --- Summary

;;; Commentary:
;;; ===========
;;; My personal Emacs configs

;;; Code:
;;; ======

;;; General
;;; ========

;;; this loads the package manager
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

;;; loads packages and activates them
(package-initialize)

;;; set command key to meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;;; Get locate command to use Mac's Spotlight
(setq locate-command "mdfind")

;;; disable scrollbar and toolbar
(scroll-bar-mode -1)
(tool-bar-mode -1)

;;; line numbers
(global-linum-mode 1)

;;; disable initial startup message
(setq inhibit-startup-message t)

;;; no tabs plz
(setq-default indent-tabs-mode nil)

;;; highlight-parens
(show-paren-mode 1)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t
   auto-save-default nil) 

;;; show similar named files sanely
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;;; remember where I was previously
(require 'saveplace)
(setq-default save-place t)

;;; ido-mode
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;;; auto-indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;;; get help better
(global-set-key (kbd "C-h") 'apropos)

;;; make help better
(setq apropos-do-all t)

;;; use clipboard
(setq x-select-enable-clipboard t)

;;; better buffer switch mode
(iswitchb-mode 1)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "*Apropos*"
    "*Compile-Log" "*Messages*"))

;;; use the flatland theme
(load-theme 'flatland t)

;;; replace yes/no with y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;; kill buffers without confirmation even when a process is running
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;;; give me tooltips
(tooltip-mode -1)
(setq tooltip-use-echo-area t)

;;; Start from Home
(setq default-directory (concat (getenv "HOME") "/"))

;;; Plugins
;;; ========

;;; set all env vars from shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;;; vim in emacs ;) 
(require 'evil)
(evil-mode t)

;;; evil-leader

(global-evil-leader-mode 1)
(global-set-key (kbd "C-f") 'projectile-find-file)
(evil-leader/set-leader ",")
(setq evil-leader/in-all-states t)

(evil-leader/set-key
  "TAB" 'next-buffer
  "S-TAB" 'previous-buffer
  "e" 'evil-normal-state
  "f" 'ido-find-file
  "F" 'projectile-find-file
  "b" 'switch-to-buffer
  "g" 'ag-project
  "s" 'save-buffer
  "d" 'kill-this-buffer
  "q" 'kill-emacs)

(require 'key-chord)
(key-chord-mode 1)

;;; Add more of these later
;; (key-chord-define-global ";;" 'ido-find-file)

;;; smex (better M-x)
(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

;;; Quack plugin for Scheme
(setq scheme-program-name "mzscheme")
;; This hook lets you use your theme colours instead of quack's ones.
(defun scheme-mode-quack-hook ()
(require 'quack)
(setq quack-fontify-style 'emacs))
(add-hook 'scheme-mode-hook 'scheme-mode-quack-hook)

;; Rainbow delimiters
(require 'rainbow-delimiters)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode)

;; Smart parens
(require 'smartparens-config)
(smartparens-global-mode t)


(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("86f4407f65d848ccdbbbf7384de75ba320d26ccecd719d50239f2c36bec18628" "9370aeac615012366188359cb05011aea721c73e1cb194798bc18576025cabeb" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
