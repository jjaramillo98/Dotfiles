;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Jesse Jaramillo"
      user-mail-address "jjaramillo@microsoft.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight
      doom-font (font-spec :family "JetBrainsMonoNL Nerd Font" :size 16 :height 1.0 :antialias "natural")
      doom-variable-pitch-font (font-spec :family "Segoe Ui" :size 16 :height 1.0 :antialias "natural")
      doom-big-font (font-spec :family "JetBrainsMonoNL Nerd Font" :size 24 :antialias "natural"))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

(setq doom-themes-treemacs-theme "doom-colors")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq org-plantuml-jar-path "/Users/jjaramillo/AppData/Roaming/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(use-package! mixed-pitch
  :hook (org-mode . mixed-pitch-mode)
  :config
  (setq mixed-pitch-set-height t)
  (set-face-attribute 'variable-pitch nil :height 1.1))


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
(after! doom-themes
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; key maps
(map! :desc "Toggle TreeMacs"
      :leader "t t" #'treemacs)

(map! :desc "TreeMacs Directory"
      :leader "t d" #'treemacs-select-directory)

(map! :desc "TreeMacs Directory"
      :leader "r u" #'treemacs-root-up)

(map! :desc "TreeMacs Directory"
      :leader "r d" #'treemacs-root-down)

(map! :desc "Toggle Modeline"
      :leader "m l" #'doom-modeline-mode)

(map! :desc "Start Docker Container"
      :leader "d r" #'docker-image-run)


(map! :desc "Show Docker Images"
      :leader "t i" #'docker-images)


;; Modeline
(require 'all-the-icons)
(setq doom-modeline-icon t)
(setq doom-modeline-major-mode-color-icon t)
(setq doom-modeline-buffer-state-icon t)
(setq doom-modeline-modal-icon t)
(setq doom-modeline-env-version t)
(setq doom-modeline-lsp t)
(setq doom-modeline-height 25)
(setq doom-modeline-bar-width 4)

(custom-set-faces!
   '(mode-line :family "MesloLGL Nerd Font Mono" :height 1.0 :antialias "natural")
   '(mode-line-inactive :family "MesloLGL Nerd Font Mono" :height 1.0 :antialias "natural"))

;;  startup hooks
(add-hook 'after-init-hook #'display-battery-mode)
(add-hook 'after-init-hook #'display-time-mode)

(setq fancy-splash-image (expand-file-name "splash/emacs-splash.svg" doom-private-dir))

;; org-roam-ui configs
(use-package! websocket
  :after org)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


(use-package! "bicep-mode"
              :load-path "/Users/jjaramillo/.bicep")

;; Emacs Application Framework
(use-package eaf
  :load-path "/Users/jjaramillo/AppData/Roaming/.emacs.d/site-lisp/emacs-application-framework"
  :custom
  ; See https://github.com/emacs-eaf/emacs-application-framework/wiki/Customization
  (eaf-browser-continue-where-left-off t)
  (eaf-browser-enable-adblocker t)
  (browse-url-browser-function 'eaf-open-browser)
  :config
  (defalias 'browse-web #'eaf-open-browser))

(require 'eaf-airshare)
(require 'eaf-browser)
(require 'eaf-camera)
(require 'eaf-file-browser)
(require 'eaf-file-manager)
(require 'eaf-file-sender)
(require 'eaf-git)
(require 'eaf-image-viewer)
(require 'eaf-jupyter)
(require 'eaf-markdown-previewer)
(require 'eaf-mindmap)
(require 'eaf-music-player)
(require 'eaf-netease-cloud-music)
(require 'eaf-org-previewer)
(require 'eaf-pdf-viewer)
(require 'eaf-rss-reader)
(require 'eaf-system-monitor)
(require 'eaf-terminal)
(require 'eaf-video-player)

(require 'eaf-evil)

(define-key key-translation-map (kbd "SPC")
    (lambda (prompt)
      (if (derived-mode-p 'eaf-mode)
          (pcase eaf--buffer-app-name
            ("browser" (if  eaf-buffer-input-focus
                           (kbd "SPC")
                         (kbd eaf-evil-leader-key)))
            ("pdf-viewer" (kbd eaf-evil-leader-key))
            ("image-viewer" (kbd eaf-evil-leader-key))
            (_  (kbd "SPC")))
        (kbd "SPC"))))

(setq eaf-webengine-default-zoom 1.6)
(setq eaf-terminal-font-size 13)
(setq eaf-terminal-font-family "JetBrainsMonoNL Nerd Font Light")

