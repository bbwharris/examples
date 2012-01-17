;;Setup load path
(add-to-list 'load-path "~/Dropbox/emacs")
(add-to-list 'load-path "~/Dropbox/emacs/emacs-rails")
(add-to-list 'load-path "~/Dropbox/emacs/haml-mode")
(add-to-list 'load-path "~/Dropbox/emacs/sass-mode")
(add-to-list 'load-path "~/Dropbox/emacs/misc")
(add-to-list 'load-path "~/Dropbox/emacs/misc/ruby-mode")
(add-to-list 'load-path "~/Dropbox/emacs/rhtml")
(add-to-list 'load-path "~/Dropbox/emacs/zencoding")
(add-to-list 'load-path "~/Dropbox/emacs/misc/color-theme-6.6.0")
(add-to-list 'load-path "~/Dropbox/emacs/misc/emacs-color-theme-solarized")
(add-to-list 'load-path "~/Dropbox/emacs/rvm.el")
(add-to-list 'load-path "~/Dropbox/emacs/coffee-mode")
(add-to-list 'load-path "~/Dropbox/emacs/cucumber.el")

;;Configuration
(setq make-backup-files nil)
(setq auto-save-default nil)
(menu-bar-mode 0)
(tool-bar-mode 0)
(setq x-select-enable-clipboard t)
(setq tramp-default-method "ssh")
(setq-default indent-tabs-mode nil)
;;no splash screen
(setq inhibit-startup-message t)
;;turn off damn bell!
(setq visible-bell t)
;;set title to path and file
(setq frame-title-format "%b (%f)")

;; main window left, upper right small, lower left term
;;(split-window-horizontally)
;;(other-window 1)
;;(split-window-vertically)


;;requires
(require 'color-theme)
(require 'yaml-mode)
(require 'font-lock)
(require 'haml-mode)
(require 'sass-mode)
(require 'zencoding-mode)
(require 'rvm)
(require 'snippet)
(require 'rails)
(require 'feature-mode)
;;(require 'rinari)
(require 'rhtml-mode)
;;(require 'haxe-mode)
(require 'coffee-mode)

;;Preferences
(defun set-tab-width (width)
  "Set tab-width to 2"
  (interactive "P")
  (set-variable 'tab-width width))
(rvm-use-default)
(cua-mode t)
(setq cua-enable-cua-keys nil)
;;setup environment
(prefer-coding-system 'utf-8)
;;(set-default-font "Consolas-11")
(set-default-font "Menlo-12")
;;(load "smart-snippet")
(color-theme-initialize)
;;(color-theme-chocolate-rain)
(color-theme-calm-forest)
;;(color-theme-solarized-dark)

;;Keybindings
(global-set-key (kbd "<f5>") 'rgrep)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;;autoloads
(setq enh-ruby-program "/Users/bbwharris/.rvm/rubies/ruby-1.9.2-p290/bin/ruby")
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(setq auto-mode-alist (cons '("\\.rtex$" . rhtml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.haml$" . haml-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sass$" . sass-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss$" . sass-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scss.erb$" . sass-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rb$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ru$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec$" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.liquid$" . rhtml-mode) auto-mode-alist))
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(autoload 'php-mode "php-mode" "Major mode for editing php" t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json.haml$" . js2-mode))
(autoload 'vbnet-mode "vbnet-mode" "Visual Basic mode." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\)$" .
				 vbnet-mode)) auto-mode-alist))

;; macros and hooks

(defun coffee-custom ()
  "coffee-mode-hook"
 (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))
(defun try-complete-abbrev (old)
   (if (expand-abbrev) t nil))


(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
            ))
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
	  (buffer-list))
  (delete-other-windows))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(twitter-header-face ((t (:background "light gray" :foreground "black")))))

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 75))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

(add-hook 'rhtml-mode-hook
	  (lambda () (rinari-launch)))
