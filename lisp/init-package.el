(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;;(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(package-initialize)

(provide 'init-package)
