;; -*- lexical-binding: t; -*-

(let* ((file (expand-file-name "config.org" user-emacs-directory)))
  (setq org-confirm-babel-evaluate nil)
  (org-babel-load-file file))
