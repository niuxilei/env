;;;; for mac setting
;;; ----------------------------------
(setq
  mac-option-key-is-control t
  mac-option-modifier 'control
  mac-command-modifier 'meta
 )
(when (eq system-type 'darwin)
  (require 'ls-lisp)
  (setq ls-lisp-use-insert-directory-program nil))
(add-to-list 'exec-path "/usr/local/bin") ;; for gtags, rc



(require 'whitespace)
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))

(add-hook 'prog-mode-hook 'whitespace-mode)

(when (not package-archive-contents)
    (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; C-u list undos
;;(require 'setup-editing)

;;; display setting
;;; ---------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages (quote (projectile material-theme elpy better-defaults org-pomodoro)))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(set-face-attribute 'default nil :height 200)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
;;;;; Put backup files neatly away
(let ((backup-dir "~/Public/emacs/backups")
      (auto-saves-dir "~/Public/emacs/auto-saves/"))
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir t))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir))

(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 5    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too




(put 'upcase-region 'disabled nil)

(show-paren-mode 1)


;;;;  kill bufer not ask
(defun kill-default-buffer ()
  "Kill the currently active buffer -- set to C-x k so that users are not asked which buffer they want to kill."
  (interactive)
  (let (kill-buffer-query-functions) (kill-buffer)))
(global-set-key (kbd "C-x k") 'kill-default-buffer)
;;(load-theme u'material t) ;; load material theme
(global-linum-mode t) ;; enable line numbers globally
(add-to-list 'exec-path "/usr/local/bin") ;; for gtags

(defun ding-ding-ding ()
  "Ding whatever the settings are."
  (interactive)
  (require 'cl-macs)
  (let ((ring-bell-function nil)
        (visible-bell nil))
    (loop repeat 100 do (ding) (other-frame 0) (sit-for 1))))

(defun my-pomodoro ()
  "Ding after a pomodoro time"
  (interactive)
  (run-at-time "25 min" nil 'ding-ding-ding))

(provide 'init-myenv)
