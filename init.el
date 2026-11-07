;; -*- lexical-binding: t; -*-
(let* ((file (expand-file-name "config.org" default-directory)))
  (org-babel-load-file file))
