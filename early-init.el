;; -*- lexical-binding: t; -*-

;; Sources:
;; https://emacs.takeokunn.org/early-init
;; https://kristofferbalintona.me/articles/surprisingly-emacs-on-android-is-pretty-good/
;; https://gitlab.com/protesilaos/dotfiles/-/blob/master/emacs/.emacs.d/early-init.el

(setq lexical-binding t)

(setq package-enable-at-startup nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(add-hook 'after-init-hook
	  (lambda ()
	    (setq default-frame-alist
		  '((horizontal-scroll-bars . nil)
		    (menu-bar-lines . 0)
		    (tool-bar-lines . 0)
		    (border-width . 0)
		    (vertical-scroll-bars . nil)
		    (scroll-bar-width . 0)
		    (undecorated . t)))))

(setq site-run-file nil
      custom-file nil)

(setq scroll-step 1)


  ;; Allow to use symlinks
  (setq find-file-visit-truename t)

  ;; Default input method
  (setq default-input-method "russian-computer")

  ;; Tabs
  (setq tab-always-indent 'complete
	indent-tabs-mode nil)

  ;; Cursor
  (setq cursor-type 'bar)


(setq inhibit-startup-message t
      inhibit-startup-buffer-menu t
      inhibit-x-resources t
      inhibit-compacting-font-caches t
      inhibit-splash-screen t
      inhibit-startup-echo-area-message user-login-name)

(setq frame-resize-pixelwise t
      frame-inhibit-implied-resize 'force)

(setq use-file-dialog nil
      use-short-answers t
      use-dialog-box t)

(setq line-number-display-limit large-file-warning-threshold
      line-number-display-limit-width 200)

(setq garbage-collection-messages nil)

(setq read-process-output-max (* 1024 1024))

;; ring-bell
(setq ring-bell-function 'ignore)

;; default-directory
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; initial
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)

;;(advice-add 'x-apply-session-resources :override 'ignore)

(setq history-delete-duplicates t)

(setq vc-follow-symlinks t)

(setq byte-compile-warnings '(cl-functions))

;; Setup Termux PATH
(when (eq 'system-type 'android)
  (let* ((path "/data/data/com.termux/files/usr/bin"))
    (setenv "PATH" (format "%s:%s" path
			   (getenv "PATH")))
    (push path exec-path)))

;; Native compilation
(setq native-comp-speed 2
      load-prefer-newer t)

(setq gc-cons-threshold (* 1024 1024 200)
      gc-cons-percentage 0.5)

(add-hook 'emacs-startup-hook
	  (lambda ()
	    (gc-cons-threshold (* 1024 1024 8))
	    (gc-cons-percentage 0.1)))

(run-with-idle-timer 5 t #'garbage-collect)

(setenv "LSP_USE_PLISTS" "true")
