;;; -*- mode: emacs-lisp; -*-

(eval-when-compile (require 'subr-x))

;; Set up lib path for native compilation.
(if (string-match "jcm-m1" (system-name))
    (setenv "LIBRARY_PATH"
            (string-join
             '("/opt/homebrew/Cellar/gcc/11.3.0/lib/gcc/11/"
               "/opt/homebrew/Cellar/libgccjit/11.3.0/lib/gcc/11"
               "/opt/homebrew/Cellar/gcc/11.3.0/lib/gcc/11/gcc/aarch64-apple-darwin21/11")
             ":"))
  (setenv "LIBRARY_PATH"
          (string-join
           '("/usr/local/opt/gcc/lib/gcc/11"
             "/usr/local/opt/libgccjit/lib/gcc/11/"
             "/usr/local/opt/gcc/lib/gcc/11/gcc/x86_64-apple-darwin21/11")
           ":")))
