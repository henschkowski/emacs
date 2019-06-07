;;; init.el --- My personal init.el file

;;; Commentary:
;;;     EMACS configuration file
;;;     (c) Ralf Henschkowski

;;; Code:


(setq vc-follow-symlinks nil)
(add-to-list 'load-path "~/.emacs.d/lisp")
(find-file-read-only "~/.emacs.d/init.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren t)
 '(clean-buffer-list-delay-general 1)
 '(clean-buffer-list-kill-never-buffer-names (quote ("*scratch*" "*Messages*" "init.el" "psps.csv" ".emacs" "notes.txt")))
 '(clean-buffer-list-kill-never-regexps (quote ("^ \\*Minibuf-.*\\*$")))
 '(csv-separators (quote (";" "	")))
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" default)))
 '(dimmer-fraction 0.35)
 '(dired-recursive-copies (quote always))
 '(dirtrack-list (quote (":\\(.*\\)\\$" 1)))
 '(frame-background-mode (quote dark))
 '(global-eldoc-mode nil)
 '(grep-highlight-matches nil)
 '(grep-use-null-device nil)
 '(helm-candidate-number-limit 5000)
 '(hlt-use-overlays-flag nil)
 '(indent-tabs-mode nil)
 '(line-number-display-limit-width 300)
 '(lisp-body-indent 2)
 '(lisp-indent-maximum-backtracking 4)
 '(lisp-tag-body-indentation 2)
 '(lisp-tag-indentation 2)
 '(magit-branch-arguments (quote ("--track")))
 '(magit-git-executable "/usr/bin/git")
 '(magit-gitk-executable "/usr/bin/gitk")
 '(magit-log-margin (quote (t "%Y-%m-%d %H:%M " magit-log-margin-width t 18)))
 '(magit-log-margin-spec (quote (40 15 magit-duration-spec)))
 '(magit-push-always-verify nil)
 '(magit-visit-ref-behavior (quote (checkout-branch)))
 '(mode-require-final-newline nil)
 '(nxml-child-indent 4)
 '(package-selected-packages
   (quote
    (helm-swoop edit-server-htmlize acme-search nord-theme evil-indent-plus highlight-indent-guides outline-magic solarized-theme magit-gitflow hungry-delete dimmer beacon focus dashboard replace+ csv-nav elpy pyvenv helm-projectile projectile better-defaults web-mode undo-tree yaml-mode urlenc realgud avy csv-mode highlight highlight-tail chess yasnippet smex smart-tabs-mode slime org-present multiple-cursors markdown-mode+ magit jedi ido-vertical-mode highlight-chars helm-google helm-flycheck grizzl git-timemachine flycheck-pyflakes flx-ido find-file-in-repository expand-region bm autopair)))
 '(package-user-dir "~/.emacs.d")
 '(projectile-generic-command
   "find . \\( -path ./.git -o -path *.class \\) -prune -o -type f -print0")
 '(projectile-indexing-method (quote alien))
 '(projectile-project-root-files-bottom-up (quote (".projectile")))
 '(projectile-tags-command
   "\"/usr/bin/ctags\" -Re --options=\"~/dev/.ctags.conf\" -f \"%s\" %s")
 '(py-smart-indentation nil)
 '(py-switch-buffers-on-execute-p nil)
 '(py-tab-indent t)
 '(python-shell-interpreter "python3")
 '(reb-re-syntax (quote string))
 '(require-final-newline nil)
 '(safe-local-variable-values (quote ((magit-refresh-buffers))))
 '(slime-load-failed-fasl (quote always))
 '(tail-hide-delay 5)
 '(tail-max-size 10)
 '(tail-volatile nil)
 '(visible-bell t)
 '(wdired-allow-to-change-permissions (quote advanced)))

(setq max-lisp-eval-depth '40000)
(setq max-specpdl-size '100000)

;; (setq exec-path (add-to-list 'exec-path "C:/Gow/bin"))
;; (setq exec-path (add-to-list 'exec-path "C:/Program Files (x86)/clisp-2.49"))

;;(setq find-program "find")

(setenv "PATH"
  (concat
   ;; Change this with your path to MSYS bin directory
   (getenv "PATH")))

;;(setq url-proxy-services '(("http" . "127.0.0.1:3128")
;;                           ("https" . "127.0.0.1:3128")))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list  'package-archives
              '("emacswiki" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/emacswiki/") t)

(package-initialize)


(defvar rh-packages '( nord-theme
                       autopair
                       avy
                       beacon
                       better-defaults
                       bm
                       chess
                       csv-mode
                       csv-nav
                       dashboard
                       dimmer
                       elpy
                       company
                       evil-indent-plus
                       evil
                       expand-region
                       find-file-in-project
                       find-file-in-repository
                       flx-ido
                       flx
                       flycheck-pyflakes
                       focus
                       git-timemachine
                       goto-chg
                       grizzl
                       helm-flycheck
                       flycheck
                       helm-google
                       helm-projectile
                       helm
                       helm-core
                       highlight-chars
                       highlight-indent-guides
                       highlight-indentation
                       hungry-delete
                       ido-vertical-mode
                       ivy
                       jedi
                       auto-complete
                       jedi-core
                       epc
                       ctable
                       concurrent
                       magit-gitflow
                       magit
                       git-commit
                       ghub
                       let-alist
                       magit-popup
                       markdown-mode+
                       markdown-mode
                       multiple-cursors
                       outline-magic
                       page-break-lines
                       popup
                       projectile
                       pkg-info
                       epl
                       python-environment
                       deferred
                       pyvenv
                       realgud
                       loc-changes
                       load-relative
                       replace+
                       s
                       seq
                       slime
                       macrostep
                       smart-tabs-mode
                       smex
                       solarized-theme
                       dash
                       test-simple
                       undo-tree
                       visual-regexp
                       with-editor
                       async
                       yaml-mode
                       yasnippet)
  "My Lisp Packages") 


(defun my-install-packages ()
  "Install only the sweetest of packages."
  (interactive)
  (package-refresh-contents)
  (mapc #'(lambda (package)
            (unless (package-installed-p package)
              (package-install package)))
        rh-packages))


(require 'better-defaults)


(defun json-format ()
  "Pretty-print JSON data."
  (interactive)
  (save-excursion
    (let ((coding-system-for-read 'utf-8)
          (coding-system-for-write 'utf-8))
      (shell-command-on-region (mark) (point) "python2 -m json.tool" (buffer-name) t))))

(defun json-to-single-line (beg end)
  "Collapse prettified json in region between BEG and END to a single line"
  (interactive "r")
  (if (use-region-p)
      (save-excursion
        (save-restriction
          (narrow-to-region beg end)
          (goto-char (point-min))
          (while (re-search-forward "\\s-+\\|\n" nil t)
            (replace-match " "))))
    (print "This function operates on a region")))


(global-set-key (kbd "C-c C-y") 'strip-convert-lines-into-one-big-string)

(global-undo-tree-mode)

;; buffer menu in current buffer instead of new one
;; (global-set-key "\C-x\C-b" 'buffer-menu);; now from better-defaults
(global-set-key "\M-j" 'join-line)
(global-set-key [f9] 'next-error)
(global-set-key [f10] 'previous-error)

(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings) ;; http://tuhdo.github.io/helm-intro.html#orgheadline21

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-link ((default nil) (nil (:foreground "cyan"))))
 '(ediff-current-diff-C ((t (:background "honeydew3"))))
 '(ediff-fine-diff-B ((t (:background "pale green"))))
 '(font-lock-builtin-face ((t (:foreground "dark orange" :slant normal :weight bold))))
 '(font-lock-comment-face ((((class color) (min-colors 8)) (:foreground "red"))))
 '(font-lock-function-name-face ((((class color) (min-colors 8)) (:foreground "lightblue" :weight bold))))
 '(font-lock-keyword-face ((((class color) (min-colors 8)) (:foreground "red" :weight bold))))
 '(helm-header ((t (:background "light slate gray" :foreground "NavajoWhite1"))))
 '(helm-selection ((t (:foreground "light sea green"))))
 '(highlight-changes ((t (:foreground "SeaGreen1"))))
 '(highlight-changes-delete ((t (:foreground "SeaGreen" :underline t))))
 '(magit-diff-file-heading-highlight ((t (:background "dark slate blue" :foreground "white"))))
 '(magit-diff-hunk-heading ((t (:background "dim gray" :foreground "orange"))))
 '(magit-diff-hunk-heading-highlight ((t (:background "SlateBlue4"))))
 '(region ((t (:background "light gray" :foreground "dim gray" :inverse-video t))))
 '(tool-bar ((((class color) (min-colors 8)) (:foreground "yellow")))))

(set-face-foreground 'minibuffer-prompt "white")

;; Always insert spaces instead of tabs
(setq-default indent-tabs-mode nil)

(setq-default tab-width 4)

;; make tab key always call a indent command.
(setq-default tab-always-indent t)

;; make tab key call indent command or insert tab character, depending on cursor position
(setq-default tab-always-indent nil)

;; make tab key do indent first then completion.
(setq-default tab-always-indent 'complete)

;;(smart-tabs-insinuate 'c 'c++ 'java 'javascript 'cperl 'python 'ruby 'nxml)


;; Switch off the menu bar
(menu-bar-mode -1)
;; Switch off the tool bar
(tool-bar-mode -1)

(show-paren-mode 't)
(column-number-mode 't)
;; enable using the minibuffer when in the minibuffer
;;(setq enable-recursive-minibuffers 't)

;; Tail mode to follow file changes
;; (require 'tail)

(require 'dashboard)
(dashboard-setup-startup-hook)

;; Show line numbers only when going to a line
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input."
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))
(global-set-key [remap goto-line] 'goto-line-with-feedback)


(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Shell mode enhancement
;; --------------------------

(require 'switch-to-shell)
(global-set-key "\C-cs" 'switch-to-shell)
(global-set-key "\C-cb" (lambda () (interactive) (switch-to-shell -1)))

;; Enable CamelCase for shell scripts
(add-hook 'sh-mode-hook 'subword-mode)

;; Allow sending a region to a shell buffer
(defun shell-region (start end)
  "Execute region START to END in an inferior shell."
  (interactive "r")
  (shell-command  (buffer-substring-no-properties start end)))


;; Remove Unique lines
;; -------------------

(defun uniquify-region-lines (beg end)
  "Remove duplicate adjacent lines in region, identified by BEG and END."
  (interactive "*r")
  (save-excursion
    (goto-char beg)
    (while (re-search-forward "^\\(.*\n\\)\\1+" end t)
      (replace-match "\\1"))))

(defun uniquify-buffer-lines ()
  "Remove duplicate adjacent lines in the current buffer."
  (interactive)
  (uniquify-region-lines (point-min) (point-max)))



;; Python
;; --------------------
;; (elpy-enable)
;; (defadvice virtualenv-activate (after virtual-pdb)
;;   (custom-set-variables
;;      '(gud-pdb-command-name
;;         (concat virtualenv-active "/bin/python -m pdb" ))))

;;(ad-activate 'virtualenv-activate)

(defun pyvenv-autoload ()
  (require 'projectile)
  (let* ((pdir (projectile-project-root)) (pfile (concat pdir ".venv")))
    (if (file-exists-p pfile)
        (pyvenv-workon (with-temp-buffer
                        (insert-file-contents pfile)
                        (nth 0 (split-string (buffer-string))))))))


(add-hook 'python-mode-hook 'pyvenv-autoload)
(setq python-shell-completion-native-enable nil)
(setq indent-tabs-mode nil)

;;; (require 'auto-complete)
(require 'autopair)
(require 'flycheck)

;;;;(setq py-install-directory "~/.emacs.d/lisp/python-mode")
;;;;(add-to-list 'load-path "~/.emacs.d/lisp/python-mode")
;;;;(require 'python-mode)
;; python words are delimited also by '_'
;;;;(modify-syntax-entry ?_ "." python-mode-syntax-table)
(modify-syntax-entry ?_ ".")
;;;;(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(setq py-electric-colon-active t)

;; Use spaces instead of tabs
(setq-default indent-tabs-mode nil)
;; Set stop-tabs to be 4 written as spaces
(setq-default tab-stop-list (number-sequence 4 120 4))

;; Set default tab space for various modes
(setq-default sgml-basic-offset 4)
(setq-default py-indent-offset 4)
(setq-default python-indent 4)

;; highlight tabs and trailing whitespace
(require 'highlight-chars)
;;;;(add-hook 'python-mode-hook 'hc-highlight-tabs)
;;;;(add-hook 'python-mode-hook 'hc-highlight-trailing-whitespace)

;; (add-hook 'python-mode-hook
;;       (lambda ()
;;         (setq-default py-indent-tabs-mode nil)
;;         (setq-default indent-tabs-mode nil)
;;         (setq-default tab-width 4)
;;         (setq-default python-indent 4)
;;         (flycheck-mode)))


;(add-hook 'python-mode-hook 'autopair-mode)
;; (add-hook 'python-mode-hook 'yas-minor-mode)

;; Enable CamelCase movement for Python
;;(add-hook 'python-mode-hook 'subword-mode)
;;(setq py-split-windows-on-execute-p nil)

;; (add-hook 'after-init-hook #'global-flycheck-mode)

; auto-complete mode extra settings
;;(setq
;; ac-auto-start 2
;; ac-override-local-map nil
;; ac-use-menu-map t
;; ac-candidate-limit 20)


;; ;; Jedi settings
(require 'jedi)
;; It's also required to run "pip install --user jedi" and "pip
;; install --user epc" to get the Python side of the library work
;; correctly.
;; With the same interpreter you're using.

;; if you need to change your python intepreter, if you want to change it
;;(setq jedi:server-command
;;      '("python2" "/home/andrea/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"))

;; (add-hook 'python-mode-hook
;; 	  (lambda ()
;; 	    (jedi:setup)
;; 	    (jedi:ac-setup)
;;             (local-set-key "\C-cd" 'jedi:show-doc)
;;             (local-set-key (kbd "M-SPC") 'jedi:complete)
;;             (local-set-key (kbd "M-.") 'jedi:goto-definition)))


;; (add-hook 'python-mode-hook 'auto-complete-mode)


;; Lisp
;; --------------------
;;(load (expand-file-name "u:/quicklisp/slime-helper.el"))
;;(setq inferior-lisp-program "clisp.exe -ansi -I")
;;(setq inferior-lisp-program "/home/tj16/bin/sbcl --noinform --no-linedit")
(add-to-list 'load-path "~/.emacs.d/lisp/slime/")
;;(require 'slime)
;;(eval-after-load "slime"
;;  '(progn
;;     (setq slime-complete-symbol*-fancy t)
;;     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
;;     (slime-setup '(slime-fancy slime-asdf  slime-banner))))




;; World Time enhancement
;; -----------------------

(defun kill-window (buffer)
  (unwind-protect
      (delete-window (get-buffer-window buffer t))
    (kill-buffer buffer)))

(defun display-time-world-temporary () 
  "Display the world times in a separate window and hide it after 5 seconds."
  (interactive)
  (progn
    (display-time-world)
    (run-with-timer 5 nil 'kill-window (get-buffer "*wclock*"))))

(global-set-key "\C-ct" 'display-time-world-temporary)


;; Text work
;; ---------

(defun underline-text (&optional underline-char)
  "Underlines the current line, inserting a new line below.  With prefix, prompt for the underlining character UNDERLINE-CHAR ."
  (interactive "*P")
  (let* ((text-start (progn (beginning-of-line-text) (current-column)))
         (text-end (progn (end-of-line) (current-column)))
         (text-length (- text-end text-start 1)))
    (setq underline-char (if (null underline-char) "-" (read-string "Underline with character: ")))
    (end-of-line) (newline)
    (indent-line-to text-start)
    (do ((x 0 (+ x 1))) ((> x text-length) t) (insert underline-char))))

(global-set-key "\C-cu" 'underline-text)
(global-set-key "\M-n" 'next-logical-line)
(global-set-key "\M-p" 'previous-logical-line)


(put 'narrow-to-region 'disabled nil)

;; make typing overwrite text selection
(delete-selection-mode 1)

;; Abbrev Mode
;;(setq abbrev-file-name             ;; tell emacs where to read abbrevs
;;      "~/elisp/abbrev_defs")
;;(setq save-abbrevs t)              ;; save abbrevs when files are saved
;;(quietly-read-abbrev-file)         ;; reads the abbreviations file on startup
;;(setq default-abbrev-mode 0)


;; Make shifted direction keys work on the Linux console or in an xterm
(when (member (getenv "TERM") '("linux" "xterm"))
  (dolist (prefix '("\eO" "\eO1;" "\e[1;"))
    (dolist (m '(("2" . "S-") ("3" . "M-") ("4" . "S-M-") ("5" . "C-")
                 ("6" . "S-C-") ("7" . "C-M-") ("8" . "S-C-M-")))
      (dolist (k '(("A" . "<up>") ("B" . "<down>") ("C" . "<right>")
                   ("D" . "<left>") ("H" . "<home>") ("F" . "<end>")))
        (define-key function-key-map
          (concat prefix (car m) (car k))
          (read-kbd-macro (concat (cdr m) (cdr k))))))))

;;;; Enhanced rectangle commands from CUA mode (without the keybindings)
(setq cua-enable-cua-keys nil)
;; (setq cua-highlight-region-shift-only t) ;; no transient mark mode
;;(setq cua-toggle-set-mark nil) ;; original set-mark behavior, i.e. no transient-mark-mode
;; (cua-mode)
;; (cua-selection-mode t)

;; Defer updating font colors etc when scrolling
;; (setq jit-lock-defer-time 0.05)


;; Dired+ mode
;; (require 'dired+)
;; (put 'dired-find-alternate-file 'disabled nil)  ;enable `a' command - only one dired buffer 
(setq dired-dwim-target t)  ;; copy/move between multiple dired buffers


;; Colors
;;(load-theme 'solarized-light t)
(setq nord-comment-brightness 15)
(load-theme 'nord t)
;; specify font for all unicode characters
(when (member "Symbola" (font-family-list))
  (set-fontset-font t 'unicode "Symbola" nil 'prepend))


;(set-language-environment "UTF-8")
;(set-default-coding-systems 'utf-8)

;(set-face-attribute 'default nil :family "Consolas" :height 105)

;(set-default-font
 ;    "-outline-Consolas-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1")

;(add-to-list 'default-frame-alist
;             '(font . "-outline-Consolas-normal-r-normal-normal-13-97-96-96-c-*-iso8859-1"))

;; ... or Lucida
;(set-face-attribute 'default nil :family "Lucida" :height 105)
;(set-default-font      "-outline-Lucida Console-normal-normal-normal-mono-14-*-*-*-c-*-iso8859-1")
;(add-to-list 'default-frame-alist '(font . "-outline-Lucida Console-normal-normal-normal-mono-14-*-*-*-c-*-iso8859-1"))



;; Slightly enlarged font on hires display
(set-face-attribute 'default nil :height 105)

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region BEGIN to END. 
You need to have `nxml-mode'.  
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))


 (defun join-region (beg end)
  "Apply `join-line' over region BEG to END."
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (goto-char beg)
        (while (< (point) end)
          (join-line 1)))))


(defun join-region-nospace (beg end)
  "Like `join-region', but do not replace the newline with space.
Run over region BEG to END."  
  (interactive "r")
  (if mark-active
      (let ((beg (region-beginning))
            (end (copy-marker (region-end))))
        (save-excursion
          (save-restriction
            (narrow-to-region beg end)
            (goto-char (point-min))
            (while (search-forward "\n" nil t)
              (replace-match "" nil t)))))))


;; Key bindings for magit mode
(global-set-key "\C-cgs" 'magit-status)
(global-set-key "\C-cgl" 'magit-log-head)

;;; C-f in the magit status buffer invokes the magit-gitflow popup. If you
;;; would like to use a different key, set the magit-gitflow-popup-key variable
;;; before loading magit-gitflow
;; (setq magit-gitflow-popup-key "C-n")

(require 'magit-gitflow)
(add-hook 'magit-mode-hook 'turn-on-magit-gitflow)

;; Expand-region mode
(global-set-key (kbd "C-$") 'er/expand-region)
(global-set-key (kbd "C-ä") 'er/contract-region)



;; Multiple Cursors

;; When you have an active region that spans multiple lines, the following will
;; add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:

(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-l") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-r") 'set-rectangular-region-anchor)



;; ;; IDO 
;; (require 'ido-vertical-mode)
;; (require 'flx-ido)
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)
;; (setq ido-enable-flex-matching t)
;; (setq ido-use-faces 't)
;; (ido-vertical-mode)
;; (setq ido-create-new-buffer 'always)
;; (flx-ido-mode 1)

;; (add-to-list 'ido-ignore-files "\\.class$")
;; (setq ido-use-virtual-buffers t)

;; (require 'smex)
;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)
;; (global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; ;; This is your old M-x.
;; (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


;; Projectile (C-c p ... [f..])
(projectile-global-mode)

;; A hack to fix that projectile asks git to lookup subdir files when
;; there is a .git directory in it, even when we defined a .projectile
;; file on project root level. Function originally defined in
;; projectile.el
(defun projectile-project-vcs (&optional project-root)
  "Determine the VCS used by the project if any.
PROJECT-ROOT is the targeted directory.  If nil, use
`projectile-project-root'."
  'none)


(def-projectile-commander-method ?s
  "Open a *shell* buffer for the project."
  ;; This requires a snapshot version of Projectile.
  (projectile-run-shell))

;; Switch project with C-c p p, then choose what to to next
(setq projectile-switch-project-action
      #'projectile-commander)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;;;;(setq projectile-completion-system 'ido)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-enable-caching nil)
(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)
;;;;; To enable fuzzy matching, add the following settings:
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(setq helm-move-to-line-cycle-in-source t)


;;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
;;(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal


(defun nzz-abgruende (numbers)
  "Convert string NUMBERS - separated by '-' - to a string. 
Thet string represents the positions of numbers in the alphabet.
Try with '6-18-9-5-4-18-9-3-8-20-8-20-8-5-15-4-15-18-22-9-19-3-8-5-18'."
  (interactive "sAlphabet code numbers separated by '-': ")
  (setq alphabet "abcdefghijklmnopqrstuvwxyz")
  (message
   (mapconcat #'identity
              (mapcar
               #'(lambda (x) (nth x (split-string alphabet "")))
               (mapcar #'string-to-number
                       (split-string numbers "-")))
              "")))


(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)

;; smart tabs mode for nxml-mode
(setq 
    nxml-child-indent 4
    nxml-attribute-indent 4
    nxml-slash-auto-complete-flag t)


;; Add folding (hide) to nxml-mode
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)
;; optional key bindings, easier than hs defaults
(define-key nxml-mode-map (kbd "C-c h") 'hs-toggle-hiding)

(add-hook 'python-mode-hook
  (lambda()
    (local-set-key (kbd "C-c <right>") 'hs-show-block)
    (local-set-key (kbd "C-c <left>")  'hs-hide-block)
    (local-set-key (kbd "C-c <up>")    'hs-hide-all)
    (local-set-key (kbd "C-c <down>")  'hs-show-all)
    (hs-minor-mode t)))


(defun decode-hex-string (hex-string)
  "Decode the HEX-STRING înplace."
  (apply #'concat 
         (loop for i from 0 to (- (/ (length hex-string) 2) 1) 
               for hex-byte = (substring hex-string (* 2 i) (* 2 (+ i 1)))
               collect (format "%c" (string-to-number hex-byte 16)))))

(defun hex-decode-region (start end) 
  "Decode a hex string in the selected region START to END."
  (interactive "r")
  (save-excursion
    (let* ((decoded-text 
            (decode-hex-string 
             (buffer-substring start end))))
      (delete-region start end)
      (insert decoded-text))))
  (provide 'decode-hex-string)
  (provide 'hex-decode-region)


(defun encode-hex-string (clear-string)
  "Encode the CLEAR-STRING înplace."
  (string-join (--map (format "%X" it) (string-to-list clear-string))))


(defun hex-encode-region (start end) 
  "Encode a string in the selected region START to END to hex."
  (interactive "r")
  (save-excursion
    (let* ((encoded-text 
            (encode-hex-string 
             (buffer-substring start end))))
      (delete-region start end)
      (insert encoded-text))))
  (provide 'encode-hex-string)
  (provide 'hex-encode-region)


;; LDAP DN regexp: "\(\w+\)[=]\{1\}\(.+?\)\(,\|$\)"



(defun delete-empty-lines (beg end)
  "Delete empty or whitespace-only lines between BEG and END"
  (interactive "r")
  (flush-lines "^[[:space:]]*$" beg end t))


(defun epochtime-to-ISO8601time (seconds-since-epoch)
  "Convert SECONDS-SINCE-EPOCH to human-readyble date."
  (interactive "nSecs sincs Epoch: ")
  (let ((datum (format-time-string "%FT%TZ" (seconds-to-time seconds-since-epoch) 't )))
    (message "%s (in your clipboard)" datum)
    (with-temp-buffer
      (insert datum)
      (clipboard-kill-region (point-min) (point-max)))))

(defun current-time-seconds ()
  "Get seconds since epoch."
  (interactive)
  (let ((seconds (float-time (current-time))))
    (message "%f (in your clipboard)" seconds)
    (with-temp-buffer
      (insert (number-to-string seconds))
      (clipboard-kill-region (point-min) (point-max)))))
  
(defun kill-buffers-matching-name-or-file (regexp)
  "Kill buffers whose name or file path match the specified REGEXP."
  (interactive "sKill buffers matching this regular expression: \n")
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
    (let ((name (buffer-name buffer))
          (filename (or (buffer-file-name buffer) default-directory  "")))
      (when (and name
                 (not (string-equal name ""))
                 (not (string-prefix-p " " name))
                 (or (string-match regexp name) (string-match regexp filename)))
        (if (and (buffer-modified-p buffer) (buffer-file-name buffer))
            (kill-buffer-ask buffer)
          (kill-buffer buffer)))))))


(add-to-list 'auto-mode-alist '("\\.esql$" . sql-mode))


(eval-after-load "org-present"
  '(progn
     (add-hook 'org-present-mode-hook
               (lambda ()
                 (org-present-big)
                 (org-display-inline-images)
                 (org-present-hide-cursor)
                 (org-present-read-only)))
     (add-hook 'org-present-mode-quit-hook
               (lambda ()
                 (org-present-small)
                 (org-remove-inline-images)
                 (org-present-show-cursor)
                 (org-present-read-write)))))

(find-file-read-only "/home/ralf/dev/notes.txt")
(find-file-read-only "/home/ralf/psps.csv")

(defun openssl-decode-cert-pem (start end)
  "Decode a PEM encoded certificate in a region between START and END using openssl."
  (interactive "r")
  (shell-command-on-region start end "openssl x509 -text"))


(defun openssl-extract-public-key-from-cert (start end)
  "Decode a PEM encoded certificate in a region between START and END using openssl."
  (interactive "r")
  (shell-command-on-region start end "openssl x509 -pubkey -noout"))


(defun openssl-decode-csr (start end)
  "Decode a PEM encoded certificate request in a region between START and END using openssl."
  (interactive "r")
  (shell-command-on-region start end "openssl req -text"))

(defun openssl-decode-cert-pkcs7 (start end)
  "Decode a PEM encoded pkcs (p7b) keystore in a region between START and END using openssl."
  (interactive "r")
  (shell-command-on-region start end "openssl pkcs7 -text -inform PEM -print_certs"))


(defun archive-extract-to-file (archive-name item-name command dir)
  "Extract ITEM-NAME from ARCHIVE-NAME using COMMAND. Save to
DIR."
  (unwind-protect
      ;; remove the leading / from the file name to force
      ;; expand-file-name to interpret its path as relative to dir
      (let* ((file-name (if (string-match "\\`/" item-name)
                            (substring item-name 1)
                          item-name))
             (output-file (expand-file-name file-name dir))
             (output-dir (file-name-directory output-file)))
        ;; create the output directory (and its parents) if it does
        ;; not exist yet
        (unless (file-directory-p output-dir)
          (make-directory output-dir t))
        ;; execute COMMAND, redirecting output to output-file
        (apply #'call-process
               (car command)            ;program
               nil                      ;infile
               `(:file ,output-file)    ;destination
               nil                      ;display
               (append (cdr command) (list archive-name item-name))))
    ;; FIXME: add unwind forms
    nil))

(defun archive-extract-marked-to-file (output-dir)
  "Extract marked archive items to OUTPUT-DIR."
  (interactive "DOutput directory: ")
  (let ((command (symbol-value (archive-name "extract")))
        (archive (buffer-file-name))
        (items (archive-get-marked ?* t))) ; get marked items; t means
                                           ; get item under point if
                                           ; nothing is marked
    (mapc
     (lambda (item)
       (archive-extract-to-file archive
                                (aref item 0) ; get the name from the descriptor
                                command output-dir))
     items)))

(require 'arc-mode)
(define-key archive-mode-map "F" #'archive-extract-marked-to-file)


(defun mwheel-scroll-all-function-all (func &optional arg)
  (if (and scroll-all-mode arg)
      (save-selected-window
        (walk-windows
         (lambda (win)
           (select-window win)
           (condition-case nil
               (funcall func arg)
             (error nil)))))
    (funcall func arg)))

(defun mwheel-scroll-all-scroll-up-all (&optional arg)
  (mwheel-scroll-all-function-all 'scroll-up arg))

(defun mwheel-scroll-all-scroll-down-all (&optional arg)
  (mwheel-scroll-all-function-all 'scroll-down arg))

(setq mwheel-scroll-up-function 'mwheel-scroll-all-scroll-up-all)
(setq mwheel-scroll-down-function 'mwheel-scroll-all-scroll-down-all)


(global-set-key (kbd "C-.") 'other-window)
(global-set-key (kbd "C-,") 'prev-window)

(defun prev-window ()
  (interactive)
  (other-window -1))

;; avy mode (jump to anything)
(global-set-key (kbd "C--") 'avy-goto-char-2)

(prefer-coding-system 'utf-8-unix)


(defun highlight-line-dups-region (&optional start end face msgp)
  (interactive `(,@(hlt-region-or-buffer-limits) nil t))
  (let ((count  0)
        line-re)
    (save-excursion
      (goto-char start)
      (while (< (point) end)
        (setq count    0
              line-re  (concat "^" (regexp-quote (buffer-substring-no-properties
                                                  (line-beginning-position)
                                                  (line-end-position)))
                               "$"))
        (save-excursion
          (goto-char start)
          (while (< (point) end)
            (if (not (re-search-forward line-re nil t))
                (goto-char end)
              (setq count  (1+ count))
              (unless (< count 2)
                (hlt-highlight-region
                 (line-beginning-position) (line-end-position)
                 face)
                (forward-line 1)))))
        (forward-line 1)))))

(require 'visual-regexp)
(define-key global-map (kbd "C-M-%") 'vr/query-replace)

(defun just-one-space-in-region (beg end)
  "replace all whitespace in the region with single spaces"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (re-search-forward "\\s-+" nil t)
        (replace-match " ")))))


(beacon-mode 1)
(dimmer-mode)
(global-set-key [C-mouse-4] 'text-scale-increase)
(global-set-key [C-mouse-5] 'text-scale-decrease)

;; Fix lie numbers with large fonts:  https://unix.stackexchange.com/questions/29786/font-size-issues-with-emacs-in-linum-mode/30087#30087
(require 'linum)
(defun linum-update-window-scale-fix (win)
  "fix linum for scaled text"
  (set-window-margins win
          (ceiling (* (if (boundp 'text-scale-mode-step)
                  (expt text-scale-mode-step
                    text-scale-mode-amount) 1)
              (if (car (window-margins))
                  (car (window-margins)) 1)
              ))))
(advice-add #'linum-update-window :after #'linum-update-window-scale-fix)

;;; init.el ends here



