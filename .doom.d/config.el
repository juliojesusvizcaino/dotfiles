;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Julio Jesús Vizcaíno Molina"
      user-mail-address "julio.vizcaino@nucleoo.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq
 lsp-file-watch-threshold 2000
 projectile-project-search-path '("~/Documents/vandersat/repositories" "~/Documents/nucleoo/repositories")
 lsp-clients-angular-language-server-command '("node"
                                               "/home/julio/.nvm/versions/node/v16.14.2/lib/node_modules/@angular/language-server"
                                               "--ngProbeLocations"
                                               "/home/julio/.nvm/versions/node/v16.14.2/lib/node_modules"
                                               "--tsProbeLocations"
                                               "/home/julio/.nvm/versions/node/v16.14.2/lib/node_modules"
                                               "--stdio")
 auth-sources '("~/.authinfo.gpg")
 magit-revision-show-gravatars '("^Author:     " . "^Commit:     ")

 vterm-module-cmake-args "-DUSE_SYSTEM_LIBVTERM=no"
 dap-python-debugger 'debugpy
 python-pytest-unsaved-buffers-behavior 'save-all
 +zen-text-scale 1.2
 lsp-pyright-multi-root nil
 ;; eglot-extend-to-xref t
 conda-anaconda-home "/home/julio/miniconda3"
 ;; flycheck-dockerfile-hadolint-executable "/bin/hadolint"

 ;; python-shell-interpreter "ipython"
 ;; python-shell-interpreter-args "--simple-prompt"
 eglot-confirm-server-initiated-edits nil
 )

;; (after! gcmh
;;   (setq gcmh-high-cons-threshold (* 1024 1024 128)))
;; gc-cons-threshold (* 1024 1024 128)
;; 100000000
;; 16777216
;; 33554432

(set-email-account!
 "nucleoo"
 '((mu4e-sent-folder       . "/gmail/Sent Mail")
   (mu4e-drafts-folder     . "/gmail/Drafts")
   (mu4e-trash-folder      . "/gmail/Trash")
   (mu4e-refile-folder     . "/gmail/All Mail")
   (smtpmail-smtp-user     . "julio.vizcaino@nucleoo.com")
   (user-mail-address      . "julio.vizcaino@nucleoo.com")    ;; only needed for mu < 1.4
   (mu4e-compose-signature . "---\nJulio Jesús Vizcaíno Molina"))
 t)

(add-to-list 'auto-mode-alist '("\\.template\\'" . sh-mode))

(after! browse-at-remote
  (add-to-list 'browse-at-remote-remote-type-regexps '("^gitlab\\.vandersat\\.com$" . "gitlab"))
  (add-to-list 'browse-at-remote-remote-type-regexps '("^hub\\.nucleoo\\.com$" . "gitlab"))
  )

(after! forge
  (add-to-list 'forge-alist '("gitlab.vandersat.com" "gitlab.vandersat.com/api/v4" "gitlab.vandersat.com" forge-gitlab-repository))
  (add-to-list 'forge-alist '("hub.nucleoo.com" "hub.nucleoo.com/api/v4" "gitlab.vandersat.com" forge-gitlab-repository))
  )

(after! eglot
  ;; (add-to-list 'eglot-server-programs '(yaml-mode . ("yaml-language-server" "--stdio")))
  ;; (add-to-list 'eglot-server-programs '(typescript-tsx-mode . ("typescript-language-server" "--stdio")))
  (add-to-list
   'eglot-server-programs
   '(web-mode
     . (
        "node"
        "/home/julio/.nvm/versions/node/v16.14.2/lib/node_modules/@angular/language-server"
        "--ngProbeLocations"
        "/home/julio/.nvm/versions/node/v16.14.2/lib/node_modules"
        "--tsProbeLocations"
        "/home/julio/.nvm/versions/node/v16.14.2/lib/node_modules"
        "--stdio")))
  )
(add-hook! (typescript-mode-hook eglot-managed-mode-hook)
  (eglot--code-action eglot-code-action-organize-imports "source.organizeImports.ts")
  )

(set-repl-handler! 'python-mode #'+python/open-ipython-repl)

;; https://github.com/hlissner/doom-emacs/issues/4894
;; (add-hook! lsp-mode
;;   (defalias '+lookup/references 'lsp-find-references))

;; (add-hook! 'lsp-after-initialize-hook
;;   (run-hooks (intern (format "%s-lsp-hook" major-mode))))

;; (defun my-flycheck-setup ()
;;   (flycheck-add-next-checker 'lsp 'python-pylint))

;; ;; These MODE-local-vars-hook hooks are a Doom thing. They're executed after
;; ;; MODE-hook, on hack-local-variables-hook. Although `lsp!` is attached to
;; ;; python-mode-local-vars-hook, it should occur earlier than my-flycheck-setup
;; ;; this way:
;; (add-hook 'python-mode-lsp-hook #'my-flycheck-setup)

(use-package! string-inflection
  :commands (string-inflection-all-cycle
             string-inflection-toggle
             string-inflection-camelcase
             string-inflection-lower-camelcase
             string-inflection-kebab-case
             string-inflection-underscore
             string-inflection-capital-underscore
             string-inflection-upcase)
  :init
  (map! :leader :prefix ("c~" . "naming convention")
        :desc "cycle" "~" #'string-inflection-all-cycle
        :desc "toggle" "t" #'string-inflection-toggle
        :desc "CamelCase" "c" #'string-inflection-camelcase
        :desc "downCase" "d" #'string-inflection-lower-camelcase
        :desc "kebab-case" "k" #'string-inflection-kebab-case
        :desc "under_score" "_" #'string-inflection-underscore
        :desc "Upper_Score" "u" #'string-inflection-capital-underscore
        :desc "UP_CASE" "U" #'string-inflection-upcase)
  (after! evil
    (evil-define-operator evil-operator-string-inflection (beg end _type)
      "Define a new evil operator that cycles symbol casing."
      :move-point nil
      (interactive "<R>")
      (string-inflection-all-cycle)
      (setq evil-repeat-info '([?g ?~])))
    (define-key evil-normal-state-map (kbd "g~") 'evil-operator-string-inflection)))

(setq-hook! 'js-mode-hook +format-with-lsp nil)
(setq-hook! 'typescript-mode-hook +format-with-lsp nil)
(setq-hook! 'web-mode-hook +format-with-lsp nil)
;; (setq-hook! 'ng2-ts-mode-hook +format-with-lsp nil)
;; (setq-hook! 'ng2-html-mode-hook +format-with-lsp nil)

;; (with-eval-after-load 'typescript-mode (add-hook 'typescript-mode-hook #'lsp))
;; (after! 'typescript-mode (add-hook 'typescript-mode-hook #'lsp))
(add-hook! 'sh-mode-hook #'flymake-shellcheck-load)

(add-hook 'eglot-managed-mode-hook
          (lambda ()
            ;; Show flymake diagnostics first.
            (setq eldoc-documentation-functions
                  (cons #'flymake-eldoc-function
                        (remove #'flymake-eldoc-function eldoc-documentation-functions)))
            ;; Show all eldoc feedback.
            (setq eldoc-documentation-strategy #'eldoc-documentation-compose)))

;; (prodigy-define-service
;;   :name "OneSat"
;;   :command "python"
;;   :args '("-m" "flask" "run")
;;   :url "http://localhost:5001/api/v2/"
;;   :cwd "~/Documents/vandersat/repositories/onesat"
;;   ;; :tags '(work)
;;   :stop-signal 'sigkill
;;   :kill-process-buffer-on-stop t
;;   )

;; (prodigy-define-service
;;   :name "processing-monitor"
;;   :command "python"
;;   :args '("-m" "flask" "run")
;;   :url "http://localhost:5002/api/processing/v1/"
;;   :cwd "~/Documents/vandersat/repositories/vds_processing_monitor"
;;   ;; :tags '(work)
;;   :stop-signal 'sigkill
;;   :kill-process-buffer-on-stop t
;;   )

(prodigy-define-service
  :name "OneSat"
  :command "flask"
  :args '("run")
  :url '("http://localhost:5001/admin/" "http://localhost:5001/api/v2/")
  :cwd "~/Documents/vandersat/repositories/onesat/"
  :init 'envrc-mode
  ;; :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t
  )

(prodigy-define-service
  :name "proc-monitor"
  :command "flask"
  :args '("run")
  :url '("http://localhost:5002/admin/" "http://localhost:5002/api/processing/v1/")
  :cwd "~/Documents/vandersat/repositories/vds_processing_monitor/"
  :init 'envrc-mode
  ;; :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t
  )

(prodigy-define-service
  :name "FrontSat"
  :command "npm"
  :args '("start")
  :url "http://localhost:4200"
  :cwd "~/Documents/vandersat/repositories/frontsat"
  ;; :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t
  )

(prodigy-define-service
  :name "proc-front"
  :command "npm"
  :args '("start")
  :url "http://localhost:4201"
  :cwd "~/Documents/vandersat/repositories/vds_processing_monitor_frontend"
  ;; :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t
  )

(prodigy-define-service
  :name "admin-frontend"
  :command "npm"
  :args '("start")
  :url "http://localhost:4202"
  :cwd "~/Documents/vandersat/repositories/admin-frontend"
  ;; :tags '(work)
  :stop-signal 'sigkill
  :kill-process-buffer-on-stop t
  :ready-message "✔ Compiled successfully."
  )

(map! :leader
      :desc "Prodigy"
      "o x" #'prodigy)

;; enable word-wrap
(add-hook 'prodigy-view-mode-hook #'+word-wrap-mode)
(add-hook 'compilation-mode-hook #'+word-wrap-mode)
