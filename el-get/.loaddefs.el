;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (global-auto-complete-mode auto-complete-mode auto-complete)
;;;;;;  "auto-complete/auto-complete" "auto-complete/auto-complete.el"
;;;;;;  (21858 30989 48881 580000))
;;; Generated autoloads from auto-complete/auto-complete.el

(autoload 'auto-complete "auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "auto-complete/auto-complete" "\
AutoComplete mode

\(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global-Auto-Complete mode is enabled.
See the command `global-auto-complete-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "auto-complete/auto-complete" nil)

(autoload 'global-auto-complete-mode "auto-complete/auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global-Auto-Complete mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.
See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ac-config-default) "auto-complete/auto-complete-config"
;;;;;;  "auto-complete/auto-complete-config.el" (21858 30989 48881
;;;;;;  580000))
;;; Generated autoloads from auto-complete/auto-complete-config.el

(autoload 'ac-config-default "auto-complete/auto-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (el-get el-get-self-checksum el-get-checksum el-get-make-recipes
;;;;;;  el-get-cd el-get-reinstall el-get-remove el-get-self-update
;;;;;;  el-get-update-packages-of-type el-get-update-all el-get-update
;;;;;;  el-get-install el-get-version) "el-get/el-get" "el-get/el-get.el"
;;;;;;  (21858 30974 100880 781000))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring.

\(fn)" t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

;;;***

;;;### (autoloads (el-get-bundle! el-get-bundle el-get-bundle-el-get)
;;;;;;  "el-get/el-get-bundle" "el-get/el-get-bundle.el" (21858 30974
;;;;;;  100880 781000))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The FORM after the property list is
treated as initialization code, which is actually an `:after'
property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(put 'el-get-bundle! 'lisp-indent-function 'defun)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (21858 30974 100880 781000))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads (ghc-debug ghc-init) "ghc-mod/elisp/ghc" "ghc-mod/elisp/ghc.el"
;;;;;;  (21858 31005 292882 449000))
;;; Generated autoloads from ghc-mod/elisp/ghc.el

(autoload 'ghc-init "ghc-mod/elisp/ghc" "\


\(fn)" nil nil)

(autoload 'ghc-debug "ghc-mod/elisp/ghc" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (structured-haskell-mode) "structured-haskell-mode/elisp/shm"
;;;;;;  "structured-haskell-mode/elisp/shm.el" (21858 31002 164882
;;;;;;  281000))
;;; Generated autoloads from structured-haskell-mode/elisp/shm.el

(autoload 'structured-haskell-mode "structured-haskell-mode/elisp/shm" "\
Structured editing for Haskell.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("auto-complete/auto-complete-pkg.el" "el-get/el-get-autoloading.el"
;;;;;;  "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el" "fuzzy/fuzzy.el"
;;;;;;  "ghc-mod/elisp/ghc-check.el" "ghc-mod/elisp/ghc-command.el"
;;;;;;  "ghc-mod/elisp/ghc-comp.el" "ghc-mod/elisp/ghc-doc.el" "ghc-mod/elisp/ghc-func.el"
;;;;;;  "ghc-mod/elisp/ghc-indent.el" "ghc-mod/elisp/ghc-info.el"
;;;;;;  "ghc-mod/elisp/ghc-ins-mod.el" "ghc-mod/elisp/ghc-pkg.el"
;;;;;;  "ghc-mod/elisp/ghc-process.el" "ghc-mod/elisp/ghc-rewrite.el"
;;;;;;  "popup/popup.el" "structured-haskell-mode/elisp/shm-ast-documentation.el"
;;;;;;  "structured-haskell-mode/elisp/shm-ast.el" "structured-haskell-mode/elisp/shm-case-split.el"
;;;;;;  "structured-haskell-mode/elisp/shm-constraint.el" "structured-haskell-mode/elisp/shm-customizations.el"
;;;;;;  "structured-haskell-mode/elisp/shm-debug.el" "structured-haskell-mode/elisp/shm-edit-string.el"
;;;;;;  "structured-haskell-mode/elisp/shm-evaporate.el" "structured-haskell-mode/elisp/shm-fold.el"
;;;;;;  "structured-haskell-mode/elisp/shm-in.el" "structured-haskell-mode/elisp/shm-indent.el"
;;;;;;  "structured-haskell-mode/elisp/shm-insert-del.el" "structured-haskell-mode/elisp/shm-layout.el"
;;;;;;  "structured-haskell-mode/elisp/shm-macros.el" "structured-haskell-mode/elisp/shm-manipulation.el"
;;;;;;  "structured-haskell-mode/elisp/shm-nav.el" "structured-haskell-mode/elisp/shm-node.el"
;;;;;;  "structured-haskell-mode/elisp/shm-overlays.el" "structured-haskell-mode/elisp/shm-reformat.el"
;;;;;;  "structured-haskell-mode/elisp/shm-simple-indent.el" "structured-haskell-mode/elisp/shm-slot.el"
;;;;;;  "structured-haskell-mode/elisp/shm-test.el" "structured-haskell-mode/elisp/shm-tests.el"
;;;;;;  "structured-haskell-mode/elisp/shm-type.el" "structured-haskell-mode/elisp/shm-yank-kill.el")
;;;;;;  (21858 31005 651947 114000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
