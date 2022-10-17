(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#0D0E16" "#D83441" "#79D836" "#D8B941" "#3679D8" "#8041D8" "#36D8BD" "#CEDBE5"])
 '(custom-safe-themes
   '("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "cf922a7a5c514fad79c483048257c5d8f242b21987af0db813d3f0b138dfaf53" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" "79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" default))
 '(exwm-floating-border-color "#0F1019")
 '(fci-rule-color "#767676")
 '(highlight-tail-colors
   ((("#172219" "color-113" "green")
     . 0)
    (("#112226" "color-79" "cyan")
     . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#0F1019" "#D85F00"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#0F1019" "#79D836"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#0F1019" "#767676"))
 '(objed-cursor-color "#D83441")
 '(pdf-view-midnight-colors (cons "#CEDBE5" "#0D0E16"))
 '(rustic-ansi-faces
   ["#0D0E16" "#D83441" "#79D836" "#D8B941" "#3679D8" "#8041D8" "#36D8BD" "#CEDBE5"])
 '(safe-local-variable-values
   '((eval setq-hook! 'python-mode-hook +format-with
      '('black "--config=black.toml"))
     (eval setq-hook! 'python-mode-hook +format-with
      '(black "--config=black.toml"))
     (eval setq-hook! 'python-mode-hook +format-with
      ('black "--config=black.toml"))
     (eval setq-hook! 'python-mode-hook +format-with
      (black "--config=black.toml"))
     (eval set-formatter! 'black "/home/julio/Documents/vandersat/repositories/vdsdb/venv/bin/black -q --config=/home/julio/Documents/vandersat/repositories/vdsdb/black.toml -")
     (eval set-formatter! 'black "/home/julio/Documents/vandersat/repositories/vdsdb/venv/bin/black -q --config=black.toml -")
     (eval set-formatter! 'black "black -q --config=black.toml -")
     (set-formatter! 'black "black -q --config=black.toml -")
     (eval add-hook 'python-mode-hook #'format-all-mode)))
 '(vc-annotate-background "#0D0E16")
 '(vc-annotate-color-map
   (list
    (cons 20 "#79D836")
    (cons 40 "#98cd39")
    (cons 60 "#b8c33d")
    (cons 80 "#D8B941")
    (cons 100 "#d89b2b")
    (cons 120 "#d87d15")
    (cons 140 "#D85F00")
    (cons 160 "#ba5548")
    (cons 180 "#9d4b90")
    (cons 200 "#8041D8")
    (cons 220 "#9d3ca5")
    (cons 240 "#ba3873")
    (cons 260 "#D83441")
    (cons 280 "#bf444e")
    (cons 300 "#a7555b")
    (cons 320 "#8e6568")
    (cons 340 "#767676")
    (cons 360 "#767676")))
 '(vc-annotate-very-old-color nil)
 '(warning-suppress-types '((lsp-mode) (lsp-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ts-fold-replacement-face ((t (:foreground nil :box nil :inherit font-lock-comment-face :weight light)))))
