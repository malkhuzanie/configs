(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
             '("nongnu" . "https://elpa.nongnu.org/nongnu/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
 '(package-selected-packages '(compat sweeprolog evil)))

(package-initialize)

(unless (package-installed-p 'evil)
  (package-refresh-contents)
  (package-install 'evil))

(setq initial-major-mode 'fundamental-mode)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;;(set-face-attribute 'fixed-pitch nil :font "IntelOne Mono")
(menu-bar-mode -1);
(scroll-bar-mode -1);
(tool-bar-mode -1);

(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)

;; smooth scrolling
(setq pixel-scroll-precision-large-scroll-height 40.0)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))  ;; one line at a time
(setq mouse-wheel-progressive-speed nil)             ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)                   ;; scroll window under mouse
(setq scroll-step 1)                                 ;; keyboard scroll one line at a time
(setq scroll-preserve-screen-position 1)
(setq scroll-conservatively 10000 scroll-preserve-screen-position 1)

;; font
(when window-system (set-fontset-font "fontset-default" '(#x600 . #x6ff) "Noto Sans Arabic"))
(set-fontset-font t 'arabic "Noto Sans Arabic")



(require 'compat)
(require 'evil)

(require 'sweeprolog)
(with-eval-after-load 'sweeprolog
  (push "--stack-limit=512m" sweeprolog-init-args))

(evil-mode 1)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

(setq scroll-margin 18)
(setq truncate-lines nil)
(setq fill-column 80)
(global-visual-line-mode 1)
(setq-default auto-fill-function 'do-auto-fill)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(add-to-list 'auto-mode-alist '("\\.plt?\\'"  . sweeprolog-mode))

;; dark mode
(when (display-graphic-p)
  (invert-face 'default))

(set-variable 'frame-background-mode 'dark)

(defun set-bidi-env ()
  "interactive"
  (setq bidi-paragraph-direction 'nil))
(add-hook 'org-mode-hook 'set-bidi-env)

;; latex
(setq org-latex-toc-command "\\tableofcontents \\clearpage")
(setq org-latex-listings 'minted
      org-latex-packages-alist '(("" "minted"))
      org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; org mode
;; enabling markdown backend
(eval-after-load "org"
  '(require 'ox-md nil t))

(require 'org-tempo)
(setq org-structure-template-alist
      '(("r" . "src rust")
	    ("c" . "src c")
        ("p" . "src cpp")
	    ("s" . "src csharp")
	    ("j" . "src json")))

;; keybindings
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(print (font-family-list))
(defun set-bidi-env () "interactive" (setq bidi-paragraph-direction 'nil))    
(add-hook 'org-mode-hook 'set-bidi-env)
