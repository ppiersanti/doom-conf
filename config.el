;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "gon"
      user-mail-address "gon@micso.com")

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
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.emacs.d/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

(load! "mylib.el")
(load! "remote-term.el")

;; backup files and save
(setq auto-save-default t
      make-backup-files t)

(use-package! smartparens
  :init (add-hook! smartparens-mode :append #'smartparens-strict-mode)
  (sp-use-smartparens-bindings)
  :bind (("M-(" . sp-wrap-round)
         ("M-<left_bracket>" . sp-wrap-square)
         ("M-{" . sp-wrap-curly)))

(use-package! company
  :init (set-company-backend! 'prog-mode
          'company-capf 'company-files 'company-dabbrev 'company-yasnippet))

(use-package! iedit
  :defer
  :config
  (set-face-background 'iedit-occurrence "Magenta")
  :bind
  ("C-;" . iedit-mode))

;; Bind tab everywhere
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (after! company                                                     ;;
;;   (global-set-key (kbd "TAB") #'company-indent-or-complete-common)) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(use-package! magit
  :defer
  :config
  (setq magit-save-repository-buffers t))

(use-package! clojure
  :defer
  :init  (setq clojure-align-forms-automatically t
               clojure-toplevel-inside-comment-form t)
  :bind (([(f5)] . cider-eval-last-sexp)
         ([(shift f5)] . cider-pprint-eval-last-sexp-to-comment)))

(use-package! cider
  :defer
  :init (setq cider-save-file-on-load t))

(use-package! treemacs
  :defer
  :bind
  ("M-0" . treemacs-select-window))

(use-package! aggressive-indent
  :init
  (global-aggressive-indent-mode 1))

(use-package! ace-window
  :defer
  :init (setq aw-ignored-buffers '(cider-repl-mode treemacs-mode)
              aw-ignore-on t)
  :bind ("M-o" . ace-window))
