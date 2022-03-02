;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Ayden Aba"
      user-mail-address "ayden.aba@cultureamp.com")

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
(setq doom-theme 'doom-zenburn)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

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

(require 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)

;; org mode config
(after! org
  (setq org-directory "~/org/")
  ;; (setq org-default-notes-file "~/org/notes.org")
  (setq org-agenda-files '("~/org/notes.org" "/Users/ayden.aba/Dropbox/org/roam/daily")))

(after! org-roam
  (remove-hook 'find-file-hook '+org-roam-open-buffer-maybe-h))

;; org-roam config
(setq org-roam-directory "/Users/ayden.aba/Dropbox/org/roam")
(setq org-roam-dailies-directory "/Users/ayden.aba/Dropbox/org/daily")

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         #'org-roam-capture--get-point
         "* %?"
         :file-name "daily/%<%Y-%m-%d>"
         :head "#+title: %<%Y-%m-%d>\n\n")))

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(after! org
  (setq org-capture-templates
        (quote (("n" "note" entry (file+headline "~/org/notes.org" "Notes")
                 "* %?")

                ("t" "todo" entry (file+headline "~/org/notes.org" "Todos")
                 "* TODO %?")))))

(after! deft
  (setq deft-directory "/Users/ayden.aba/Dropbox/org/roam"))

(setenv "JAVA_HOME" "/usr/local/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home")

(add-hook 'org-roam-file-setup-hook
          (lambda ()
            (interactive)
            (pcase (org-roam-buffer--visibility)
              ('visible (org-roam-buffer-deactivate)))))

(add-to-list 'load-path "~/.doom.d/packages/asdf.el")
(require 'asdf)

(add-hook 'after-init-hook
          (lambda ()
            (interactive)
            (find-file "~/Dropbox/org/roam/daily/2022-02-28.org")))

(setq org-pandoc-options-for-markdown '((wrap . "none")))
