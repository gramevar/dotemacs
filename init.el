;; -*- lexical-binding: t; -*-
(let* ((file (expand-file-name "config.org" user-emacs-directory)))
  (org-babel-load-file file))
