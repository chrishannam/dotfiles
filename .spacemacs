;; Configuration layers
;; --------------------

(defun dotspacemacs/layers ()
  (setq-default

   dotspacemacs-delete-orphan-packages nil
   dotspacemacs-distribution 'spacemacs

   dotspacemacs-configuration-layers

   '(
     (auto-completion :variables
                      ;; auto-completion-enable-help-tooltip t
                      auto-completion-return-key-behavior nil
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-enable-sort-by-usage t
                      :disabled-for org)
     (c-c++ :variables
            c-c++--enable-clang-support t)
     clojure
     nginx
     colors

     (clojure :variables
              clojure-enable-fancify-symbols t)

     emacs-lisp
     ;; eyebrowse
     git
     html
     markdown
     (org :variables
          org-agenda-files (quote ("~/Dropbox/org-mode/journal.org"))
          org-hide-emphasis-markers t
          org-capture-templates
          '(;; other entries
            ("j" "Journal entry" plain
             (file+datetree+prompt "~/Dropbox/org-mode/journal.org")
             "**** %?"))


          org-export-babel-evaluate nil
          org-src-preserve-indentation t
          org-todo-keywords (quote
                   ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d@/!)")
                    (sequence "WAITING(w@/!)" "REVIEW(r)"
                        "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "MERGED(m)")))
          org-todo-keyword-faces (quote
                                  (
                                   ("TODO" :foreground "red" :width bold)
                                   ("NEXT" :foreground "blue" :width bold)
                                   ("DONE" :foreground "forest green" :width bold)
                                   ("WAITING" :foreground "orange" :width bold)
                                   ("REVIEW" :foreground "orange" :width bold)
                                   ("HOLD" :foreground "magenta" :width bold)
                                   ("CANCELLED" :foreground "forest gree" :width bold)
                                   ("MERGED" :foreground "forest gree" :width bold)))
          org-log-done (quote time)
          org-log-into-drawer t
          org-log-state-notes-insert-after-drawers nil
          org-agenda-files (quote ("~/Dropbox/org-mode/journal.org"))
          org-hide-emphasis-markers t

          )
     ocaml
     osx

     (python :variables
             python-fill-docstring-style 'pep-257-nn
             python-fill-column 100
             python-test-runner 'pytest)
     ranger
     semantic
     terraform
     (shell :variables
            shell-default-shell 'shell)
     (syntax-checking :variables
                      syntax-checking-enable-by-default nil)
     themes-megapack
     (theming :variables
              theming-headings-inherit-from-default 'all
              theming-headings-same-size 'all
              theming-headings-bold 'all)
     spell-checking
     (version-control :variables
                      version-control-diff-tool 'diff-hl
                      git-magit-status-fullscreen t)
     yaml)

   dotspacemacs-additional-packages `(
                                      cask
                                      (cram-mode
                                       :location (recipe
                                                  :fetcher github
                                                  :repo "signalpillar/cram-mode"))
                                      (gifcast :location local)
                                      virtualenvwrapper
                                      nix-mode
                                      ;; helm-org-rifle
                                      graphviz-dot-mode
                                      helm-dash)
   dotspacemacs-excluded-packages `()))

(defun dotspacemacs/init ()
  "Initialization function.
   This function is called at the very startup of Spacemacs initialization
   before layers configuration."

  (setq-default
   exec-path-from-shell-arguments '("-l")
   dotspacemacs-elpa-https t
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
	 dotspacemacs-check-for-update nil
   dotspacemacs-editing-style 'vim

   dotspacemacs-themes '(
                         ;; light theemes
                         leuven
                         default
                         ;; soft-stone
                         ;; spacemacs-light
                         ;; twilight-bright
                         ;; tao-yang
                         ;; mccarthy
                         ;; ritchie
                         ;; stekene-light
                         ;; organic-green
                         ;; occidental
                         ;; monochrome-bright
                         ;; minimal-light
                         ;; dark themes
                         ;; material
                         ;; molokai
                         ;; apropospriate-light
                         colorsarenice-dark
                         zenburn
                         twilight)

   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t

   dotspacemacs-default-font '("Monaco"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 0.75)

   dotspacemacs-leader-key ","
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key "SPC"
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   dotspacemacs-command-key ":"
   dotspacemacs-remap-Y-to-y$ t
   dotspacemacs-use-ido nil
   dotspacemacs-helm-resize t
   dotspacemacs-helm-position 'bottom
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-smooth-scrolling t
   dotspacemacs-search-tools '("ag" "grep")

   ))

(defun dotspacemacs/user-init ()
  (setq-default
   

   ;; Miscellaneous
   require-final-newline t
   x-select-enable-clipboard t

   ;; Backups
   backup-directory-alist `((".*" . ,temporary-file-directory))
   auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
   backup-by-copying t
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   make-backup-files nil

   ;; Evil
   evil-shift-round nil
   evil-want-C-i-jump nil

   ;; Whitespace mode
   whitespace-style '(face tabs tab-mark newline-mark)
   whitespace-display-mappings
   '((newline-mark 10 [172 10])
     (tab-mark 9 [9655 9]))

   ;; Smartparens
   sp-highlight-pair-overlay nil
   sp-highlight-wrap-overlay nil
   sp-highlight-wrap-tag-overlay nil

   ;; Flycheck
   flycheck-check-syntax-automatically '(save mode-enabled)

   ;; Deft
   deft-extension "rst"
   deft-text-mode 'rst-mode
   deft-directory "~/Documents/Wuala/MdNotes/"
   deft-use-filename-as-title t

   ;; Avy
   avy-all-windows 'all-frames
   ))

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  (defun jao-toggle-selective-display ()
    (interactive)
    (set-selective-display (if selective-display nil 1)))

  (global-set-key [f3] 'jao-toggle-selective-display)

  (setq-default
   powerline-default-separator 'alternate
   guide-key/popup-window-position :right
   )

  (set-fill-column 100)
  (global-set-key (kbd "C-=") 'zoom-frm-in)
  (global-set-key (kbd "C--") 'zoom-frm-out)
  (evil-leader/set-key "of" 'neotree-find)
  (setq clojure-enable-fancify-symbols t)
  (setq flycheck-display-errors-function 'flycheck-display-error-messages-unless-error-list)

  ;; Miscellaneous
  (add-hook 'text-mode-hook 'auto-fill-mode)
  (add-hook 'makefile-mode-hook 'whitespace-mode)
  (require 'cram-mode)

  (add-hook 'python-mode-hook 'flycheck-mode)

  ;; Org-babel
  (org-indent-mode)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((awk . t)
     (dot . t)
     (emacs-lisp . t)
     (gnuplot . t)
     (makefile . t)
     (ocaml . t)
     (org . t)
     (perl . t)
     (python . t)
     (shell . t)
     (sql . t)
     (sqlite . t)))

  ;; Disable smartparens highlighting
  (with-eval-after-load 'smartparens
    (show-smartparens-global-mode -1))
  )

(setq markdown-open-command "~/bin/open_md")



(defun sp/path/parent-dir (dir)
  (file-name-directory (directory-file-name dir)))

(defun sp/tox/find-tox-dirs-in-project (project-root-dir)

  (defun -find-toxenv-bin-dirs (root)
    (projectile-files-via-ext-command
     (format "find %s -type d -name 'bin' -path '*/.tox/*/bin' -print0" root)))

  (-map (lambda (file) (sp/path/parent-dir (sp/path/parent-dir file)))
        (-find-toxenv-bin-dirs project-root-dir)))

(defun sp/tox/activate-current-project-tox-env ()
  (interactive)
  (let* (
         (venv-dirs (sp/tox/find-tox-dirs-in-project (projectile-project-root)))
         (venv-dirs-length (length venv-dirs)))
    (progn
      (venv-set-location
       (if (> venv-dirs-length 1)
           (helm-comp-read "Choose tox directory to workon" venv-dirs)
         (if (= venv-dirs-length 0)
             (error "The project doesn't have created tox virtual environments.")
           (car venv-dirs))))
      (venv-workon))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-hidden-regexp-list
   (quote
    ("^\\." "\\.pyc$" "~$" "^#.*#$" "\\.elc$" "__pycache__")))
 '(package-selected-packages
   (quote
    (caml powerline log4e gntp parent-mode gitignore-mode fringe-helper git-gutter+ pos-tip flx iedit anzu goto-chg undo-tree web-completion-data hydra peg eval-sexp-fu highlight spinner pkg-info shut-up epl bind-map bind-key pythonic popup f nginx-mode diminish seq package-build projectile markdown-mode alert s winum solarized-theme madhat2r-theme fuzzy company-ansible org packed auto-complete yasnippet anaconda-mode smartparens evil avy magit-popup async haml-mode dash colorsarenice-theme web-mode terraform-mode moe-theme jazz-theme helm-projectile git-gutter-fringe evil-mc eshell-z clj-refactor cider alect-themes flycheck autothemer company request helm helm-core magit git-commit zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler with-editor window-numbering which-key volatile-highlights virtualenvwrapper vi-tilde-fringe uuidgen utop use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tuareg tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stickyfunc-enhance srefactor spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restart-emacs ranger rainbow-mode rainbow-identifiers rainbow-delimiters railscasts-theme queue quelpa pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paredit paradox osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme ocp-indent occidental-theme obsidian-theme noctilux-theme nix-mode niflheim-theme neotree naquadah-theme mustang-theme multiple-cursors multi-term move-text monokai-theme monochrome-theme molokai-theme mmm-mode minimal-theme merlin material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme less-css-mode launchctl jinja2-mode jbeans-theme ir-black-theme inkpot-theme info+ inflections indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hcl-mode hc-zenburn-theme gruvbox-theme gruber-darker-theme graphviz-dot-mode grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter gh-md gandalf-theme flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu espresso-theme eshell-prompt-extras esh-help emmet-mode elisp-slime-nav edn dumb-jump dracula-theme django-theme disaster diff-hl darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme cram-mode company-web company-statistics company-c-headers company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized color-identifiers-mode cmake-mode clues-theme clojure-snippets clojure-mode clean-aindent-mode clang-format cider-eval-sexp-fu cherry-blossom-theme cask busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile apropospriate-theme anti-zenburn-theme ansible-doc ansible ample-zen-theme ample-theme aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pytest-cmd-flags "-v -x -s"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-latex-sectioning-0-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-1-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-2-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-3-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-4-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-sectioning-5-face ((t (:inherit default :height 1.0 :weight bold))))
 '(font-latex-slide-title-face ((t (:inherit default :height 1.0 :weight bold)))))
