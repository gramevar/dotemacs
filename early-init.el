;; -*- lexical-binding: t; -*-

;; Sources:
;; https://emacs.takeokunn.org/early-init
;; https://kristofferbalintona.me/articles/surprisingly-emacs-on-android-is-pretty-good/

;; Setup Termux PATH
(when (eq 'system-type 'android)
  (let* ((path "/data/data/com.termux/files/usr/bin"))
    (setenv "PATH" (format "%s:%s" path
			   (getenv "PATH")))
    (push path exec-path)))

(setq package-enable-at-startup nil)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars . nil) default-frame-alist)
(push '(undecorated . t) default-frame-alist)

(setq site-run-file nil)

(setq inhibit-startup-message t)

(setq gc-cons-threshold (* 10 128 1024 1024))
(setq garbage-collection-messages nil)

(setq read-process-output-max (* 8 1024 1024))

;; ring-bell
(setq ring-bell-function 'ignore)

;; default-directory
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; initial
(setq initial-scratch-message nil)
(setq initial-major-mode 'fundamental-mode)

(advice-add 'x-apply-session-resources :override 'ignore)

(setq inhibit-compacting-font-caches t)

(setq history-delete-duplicates t)

(setq vc-follow-symlinks t)

(setq byte-compile-warnings '(cl-functions))

(add-hook 'emacs-startup-hook
	  (lambda () (gc-cons-threshold (* 1024 1024 2))))
