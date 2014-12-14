;;; package --- Summary

;;; Commentary:
;;; This is my Emacs config

;;; Code:
(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("melpa" . "http://melpa.milkbox.net/packages/")))

;;; loads packages and activates them
(package-initialize)

;;; set command key to meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;;; wrap words properly
(global-visual-line-mode t)

;;; line numbers for everybody!
(setq linum-format "  %d  ")
(set-window-margins nil 2)
(global-linum-mode t)

;;; hide scroll bar and toolbar on GUI mode
(when (window-system)
  (scroll-bar-mode -1)
  (tool-bar-mode -1))

;;; hide welcome message
(setq inhibit-startup-message t)

;;; show matching parens
(show-paren-mode 1)

;;; set font/font size
(set-frame-font "Monaco For Powerline-12")
(setq-default line-spacing 5)

;;; ask y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;; selected text must be overridden when typed over
(delete-selection-mode t)

;;; backup
(setq backup-directory-alist `(("." . "~/.saves")))
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;; add colors to the shell
(setq ansi-color-names-vector
  ["black" "red" "green" "yellow" "PaleBlue" "magenta" "cyan" "white"])

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;; fix unicode in terminal
(add-hook 'term-exec-hook
          (function
           (lambda ()
             (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))))
