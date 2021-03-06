
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;;; ME Stuff
;; reveal.js
(setq org-re-reveal-root "file:///home/johannes/reveal.js/")

;; recent files
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;load doom-one theme
(load-theme 'doom-one t)

;; start with linenumbers (linum)
(global-nlinum-mode 1)

;; word wrap
(global-visual-line-mode t)

;; copy paste pictures
(require 'org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)

;; org-line wrap
(add-hook 'org-mode-hook #'toggle-word-wrap)

;; org-download
(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)

(setq inhibit-splash-screen t)
;; org commands
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;;refile
(setq org-refile-targets (quote ((nil :maxlevel . 10)
                             (org-agenda-files :maxlevel . 10))))

(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)
(setq org-completion-use-ido nil)
(setq org-refile-allow-creating-parent-nodes (quote confirm))

;;custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e1ecb0536abec692b5a5e845067d75273fe36f24d01210bf0aa5842f2a7e029f" default)))
 '(font-use-system-font t)
 '(ivy-mode t)
 '(org-agenda-files
   (quote
    ("/media/windows/Dokumente und Einstellungen/johan/Documents/Dokumente Geordnet/Studium/Boku/Master/066_447 Water Management/Masterthesis/masterthesis/Masterthesis.org" "~/Dropbox/Apps/orgmode/2020_todo.org")))
 '(org-capture-templates
   (quote
    (("t" "Todos - Inbox" entry
      (file+headline "~/Dropbox/Apps/orgmode/2020_todo.org" "Inbox")
      "* TODO %? 
 %U"))))
 '(org-download-backend "wget \"%s\" -O \"%s\"")
 '(org-export-backends (quote (ascii html icalendar latex md odt)))
 '(org-goto-auto-isearch nil)
 '(org-habit-show-done-always-green nil)
 '(org-habit-show-habits-only-for-today nil)
 '(org-habit-today-glyph 94)
 '(org-hide-leading-stars t)
 '(org-indirect-buffer-display (quote new-frame))
 '(org-startup-indented t)
 '(org-super-agenda-mode nil)
 '(org-use-speed-commands t)
 '(package-selected-packages
   (quote
    (org-pomodoro nlinum org-ref org-bullets org-themis dired-sidebar org-sidebar speed-type real-auto-save undo-tree ivy doom-themes org-noter which-key org-download multiple-cursors org-re-reveal helm-orgcard helm-org helm-org-rifle helm magit)))
 '(save-place-mode t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(find-file "/media/windows/Dokumente und Einstellungen/johan/Documents/Dokumente Geordnet/Studium/Boku/Master/066_447 Water Management/Masterthesis/masterthesis/Masterthesis.org")
(find-file "~/Dropbox/Apps/orgmode/2020_todo.org")
