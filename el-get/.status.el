((auto-complete status "installed" recipe
		(:name auto-complete :features
		       (auto-complete auto-complete-config)
		       :post-init
		       (ac-config-default)
		       :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (ghc-mod status "installed" recipe
	  (:name ghc-mod :post-init
		 (progn
		   (autoload 'ghc-init "ghc" nil t)
		   (defun el-get-ghc-mod-hook nil
		     (ghc-init)
		     (flymake-mode))
		   (add-hook 'haskell-mode-hook 'el-get-ghc-mod-hook))
		 :description "Happy Haskell programming" :type github :pkgname "kazu-yamamoto/ghc-mod" :load-path "elisp"))
 (haskell-mode status "required" recipe nil)
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (structured-haskell-mode status "installed" recipe
			  (:name structured-haskell-mode :depends haskell-mode :type github :pkgname "chrisdone/structured-haskell-mode" :features shm :load-path "elisp")))
