;;; redish-theme.el --- A dark red-themed color scheme for Emacs
(deftheme redish
  "A dark theme with red accents.")

(let ((class '((class color) (min-colors 89)))
      ;; Color definitions
      (normal-bg           "#000000")
      (normal-fg           "#C2C2C2")
      (focus-fg            "#af5f5f")
      
      (lighthighlight      "#FF875F")
      (stand-out1          "#FF00FF")
      (stand-out2          "#FFCC00")
      
      (slightestred        "#D78787")
      (slightred           "#aa4538")
      (red                 "#D75F5F")
      (red-dim             "#AF0000")
      (red-dimmer          "#9F0000")
      
      (lightgray           "#606060")
      (gray                "#303030")
      (darkgray            "#121212")
      (black               "#000000"))

  (custom-theme-set-faces
   'redish

   ;; Basic faces
   `(default ((,class (:foreground ,normal-fg :background ,normal-bg))))
   `(cursor ((,class (:background ,lighthighlight))))
   `(region ((,class (:foreground ,slightred :background ,gray :weight bold))))
   `(highlight ((,class (:background ,gray))))
   `(hl-line ((,class (:foreground ,red-dimmer :weight bold))))
   `(fringe ((,class (:foreground ,normal-fg :background ,gray))))
   `(vertical-border ((,class (:foreground ,gray))))
   
   ;; Font-lock (syntax highlighting)
   `(font-lock-builtin-face ((,class (:foreground ,slightred :weight bold))))
   `(font-lock-comment-face ((,class (:foreground ,red-dimmer :weight bold))))
   `(font-lock-constant-face ((,class (:foreground ,slightestred :weight bold))))
   `(font-lock-function-name-face ((,class (:foreground ,slightred :weight bold))))
   `(font-lock-keyword-face ((,class (:foreground ,slightestred :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,slightestred :weight bold))))
   `(font-lock-type-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-variable-name-face ((,class (:foreground ,slightred :weight bold))))
   `(font-lock-warning-face ((,class (:foreground ,red :weight bold))))
   `(font-lock-preprocessor-face ((,class (:foreground ,slightred))))
   `(font-lock-doc-face ((,class (:foreground ,red-dimmer :weight bold))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,red))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,red))))
   
   ;; Line numbers
   `(line-number ((,class (:foreground ,red :background ,normal-bg))))
   `(line-number-current-line ((,class (:foreground ,red :background ,normal-bg :weight bold))))
   
   ;; Mode line
   `(mode-line ((,class (:foreground ,slightred :background ,darkgray :weight bold :box nil))))
   `(mode-line-inactive ((,class (:foreground ,normal-fg :background ,darkgray :weight bold :box nil))))
   `(mode-line-buffer-id ((,class (:foreground ,slightred :weight bold))))
   `(mode-line-emphasis ((,class (:foreground ,red :weight bold))))
   `(mode-line-highlight ((,class (:foreground ,slightred :background ,gray))))
   
   ;; Header line
   `(header-line ((,class (:foreground ,slightred :background ,darkgray :weight bold))))
   
   ;; Eldoc
   `(eldoc-highlight-function-argument ((,class (:foreground ,red :weight bold))))
   
   ;; Minibuffer
   `(minibuffer-prompt ((,class (:foreground ,red :weight bold))))
   
   ;; Search
   `(isearch ((,class (:foreground ,black :background ,lighthighlight :weight bold))))
   `(isearch-fail ((,class (:foreground ,red :background ,normal-bg :weight bold))))
   `(lazy-highlight ((,class (:foreground ,black :background ,slightred :weight bold))))
   `(match ((,class (:foreground ,black :background ,slightred :weight bold))))
   
   ;; Show-paren
   `(show-paren-match ((,class (:foreground ,stand-out2 :background ,black :weight bold))))
   `(show-paren-mismatch ((,class (:foreground ,normal-bg :background ,focus-fg))))
   
   ;; Links
   `(link ((,class (:foreground ,lighthighlight :underline t))))
   `(link-visited ((,class (:foreground ,focus-fg :underline t))))
   
   ;; Completions
   `(completions-common-part ((,class (:foreground ,slightestred))))
   `(completions-first-difference ((,class (:foreground ,red :weight bold))))
   
   ;; Company mode
   `(company-tooltip ((,class (:foreground ,slightestred :background ,gray))))
   `(company-tooltip-selection ((,class (:foreground ,gray :background ,slightestred))))
   `(company-tooltip-common ((,class (:foreground ,red :weight bold))))
   `(company-scrollbar-bg ((,class (:background ,normal-bg))))
   `(company-scrollbar-fg ((,class (:background ,lighthighlight))))
   
   ;; Errors and warnings
   `(error ((,class (:foreground ,normal-bg :background ,focus-fg :weight bold))))
   `(warning ((,class (:foreground ,red :weight bold :inherit unspecified))))
   `(success ((,class (:foreground ,focus-fg :weight bold))))
   
   ;; Bidirectional text
   `(confusingly-reordered ((,class (:foreground ,red :background ,normal-bg :weight bold))))
   
   ;; Dired
   `(dired-directory ((,class (:foreground ,focus-fg :weight bold))))
   `(dired-symlink ((,class (:foreground ,slightred :background ,normal-bg :inherit unspecified))))
   `(dired-symlink-filename ((,class (:foreground ,slightred :background ,normal-bg))))
   `(dired-broken-symlink ((,class (:foreground ,red :background ,normal-bg :weight bold :inherit unspecified :underline nil))))
   `(dired-marked ((,class (:foreground ,stand-out2 :weight bold))))
   `(dired-perm-write ((,class (:foreground ,normal-fg))))
   
   ;; Org mode
   `(org-level-1 ((,class (:foreground ,slightestred :weight bold))))
   `(org-level-2 ((,class (:foreground ,slightred :weight bold))))
   `(org-level-3 ((,class (:foreground ,red))))
   `(org-level-4 ((,class (:foreground ,focus-fg))))
   `(org-todo ((,class (:foreground ,normal-bg :background ,red :weight bold))))
   `(org-done ((,class (:foreground ,lightgray :weight bold))))
   `(org-link ((,class (:foreground ,lighthighlight :underline t))))
   `(org-code ((,class (:foreground ,slightestred))))
   `(org-block ((,class (:foreground ,normal-fg :background ,gray))))
   `(org-block-begin-line ((,class (:foreground ,red-dimmer :weight bold))))
   `(org-block-end-line ((,class (:foreground ,red-dimmer :weight bold))))
   
   ;; Diff
   `(diff-added ((,class (:foreground ,focus-fg :background ,normal-bg))))
   `(diff-removed ((,class (:foreground ,red-dim :background ,normal-bg))))
   `(diff-changed ((,class (:foreground ,slightestred :background ,gray))))
   `(diff-refine-added ((,class (:foreground ,focus-fg :background ,gray))))
   `(diff-refine-removed ((,class (:foreground ,red-dim :background ,gray))))
   
   ;; Magit
   `(magit-section-heading ((,class (:foreground ,slightestred :weight bold))))
   `(magit-diff-added ((,class (:foreground ,focus-fg :background ,normal-bg))))
   `(magit-diff-removed ((,class (:foreground ,red-dim :background ,normal-bg))))
   `(magit-diff-context ((,class (:foreground ,lightgray))))
   `(magit-branch-local ((,class (:foreground ,slightred :weight bold))))
   `(magit-branch-remote ((,class (:foreground ,focus-fg :weight bold))))
   
   ;; Flycheck/Flymake
   `(flycheck-error ((,class (:underline (:color ,red :style wave)))))
   `(flycheck-warning ((,class (:underline (:color ,stand-out2 :style wave)))))
   `(flycheck-info ((,class (:underline (:color ,focus-fg :style wave)))))
   `(flymake-error ((,class (:underline (:color ,red :style wave)))))
   `(flymake-warning ((,class (:underline (:color ,stand-out2 :style wave)))))
   `(flymake-note ((,class (:underline (:color ,focus-fg :style wave)))))
   
   ;; Whitespace mode
   `(whitespace-space ((,class (:foreground ,lightgray))))
   `(whitespace-tab ((,class (:foreground ,lightgray))))
   `(whitespace-trailing ((,class (:background ,red-dimmer))))
   
   ;; Tab bar/line
   `(tab-bar ((,class (:foreground ,normal-fg :background ,darkgray :weight bold))))
   `(tab-bar-tab ((,class (:foreground ,slightred :background ,normal-bg :weight bold :underline t))))
   `(tab-bar-tab-inactive ((,class (:foreground ,normal-fg :background ,darkgray :weight bold))))
   `(tab-line ((,class (:foreground ,normal-fg :background ,darkgray :weight bold))))
   `(tab-line-tab ((,class (:foreground ,slightred :background ,normal-bg :weight bold))))
   `(tab-line-tab-inactive ((,class (:foreground ,normal-fg :background ,darkgray :weight bold))))
   `(tab-line-tab-current ((,class (:foreground ,slightred :background ,normal-bg :weight bold :underline t))))
   
   ;; Helm
   `(helm-header ((,class (:foreground ,slightestred :background ,darkgray :weight bold))))
   `(helm-source-header ((,class (:foreground ,slightred :background ,darkgray :weight bold))))
   `(helm-selection ((,class (:foreground ,gray :background ,slightestred))))
   `(helm-match ((,class (:foreground ,red :weight bold))))
   `(helm-candidate-number ((,class (:foreground ,lighthighlight))))
   
   ;; Ivy
   `(ivy-current-match ((,class (:foreground ,gray :background ,slightestred))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,red))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,red :weight bold))))
   
   ;; Terminal
   `(term-color-black ((,class (:foreground ,black :background ,black))))
   `(term-color-red ((,class (:foreground ,red :background ,red))))
   `(term-color-green ((,class (:foreground ,focus-fg :background ,focus-fg))))
   `(term-color-yellow ((,class (:foreground ,stand-out2 :background ,stand-out2))))
   `(term-color-blue ((,class (:foreground ,slightred :background ,slightred))))
   `(term-color-magenta ((,class (:foreground ,stand-out1 :background ,stand-out1))))
   `(term-color-cyan ((,class (:foreground ,lighthighlight :background ,lighthighlight))))
   `(term-color-white ((,class (:foreground ,normal-fg :background ,normal-fg))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'redish)

;;; redish-theme.el ends here
