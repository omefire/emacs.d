;; ;; NO FRILLS
;; (dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
;;   (when (fboundp mode) (funcall mode -1)))
;; (setq inhibit-startup-screen t)
;; ;; NO JUNK
;; (setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
;;       backup-directory-alist `((".*" . ,temporary-file-directory)))
;; ;; EL-GET
;; (add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))
;; (defun el-get-sync-recipes (overlay)
;;   (let* ((recipe-glob (locate-user-emacs-file (concat overlay "/recipes/*.rcp")))
;;          (recipe-files (file-expand-wildcards recipe-glob))
;;          (recipes (mapcar 'el-get-read-recipe-file recipe-files)))
;;     (mapcar (lambda (r) (add-to-list 'el-get-sources r)) recipes)
;;     (el-get 'sync (mapcar 'el-get-source-name recipes))))
;; (setq el-get-user-package-directory user-emacs-directory)
;; ;; EL-GET SYNC OVERLAYS
;; (el-get-sync-recipes "el-get-haskell")
;; (el-get-sync-recipes "el-get-user")
;; ;; CUSTOM FILE
;; (setq custom-file (locate-user-emacs-file "custom.el"))
;; (load custom-file 'noerror)

;; HASKELL MODE
;;(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(put 'upcase-region 'disabled nil)

(require 'package)
(add-to-list 'package-archives
  '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(load-theme 'deeper-blue t)


;; JAVASCRIPT SETUP
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
(add-to-list 'auto-mode-alist (cons (rx ".js" eos) 'js2-mode))

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(setq js2-highlight-level 3)

(define-key js-mode-map "{" 'paredit-open-curly)
(define-key js-mode-map "}" 'paredit-close-curly-and-newline)

(add-to-list 'load-path "~/.emacs.d/web-beautify")
(require 'web-beautify) ;; Not necessary if using ELPA package
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c b") 'web-beautify-js))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(define-key js-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c b") 'web-beautify-js))

(eval-after-load 'sgml-mode
  '(define-key html-mode-map (kbd "C-c b") 'web-beautify-html))

(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c b") 'web-beautify-css))

(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))

;; Set tern up for javascript: See http://ternjs.net/doc/manual.html#emacs
;; ToDO: automate the install of all of this init.el on new machines (using make or similar tools). e.g: install npm if not installed and call it
(add-to-list 'load-path "~/.emacs.d/tern/emacs")
(autoload 'tern-mode "tern.el" nil t)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
