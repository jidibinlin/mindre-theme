;;; mindre-theme.el --- Minimal, light theme -*- lexical-binding: t -*-

;; Author: Erik Bäckman <contact@ebackman.net>
;; Version: 0.1.3
;; Package-Requires: ((emacs "26.1"))
;; Keywords: faces
;; Homepage: https://github.com/erikbackman/mindre-theme

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;; ---------------------------------------------------------------------

;;; Commentary:

;; Mindre (which is the Swedish word for “less”) tries to strike a good balance
;; between usability and minimalism by almost being a monochrome theme but with
;; a splash of color.
;;
;; Three colors are used to make certain language constructs stand out
;; enough for your eyes to notice them without being distracting.
;; The colors (in order of importance) are:
;; 1. #5c3e99 (mindre-keyword)
;;    Preferably used for language constructs that acts as the beginning
;;    or end of a clause, such as if/then/else, when, where etc.
;; 2. #16524F (mindre-type)
;; 3. #54433a (mindre-verbatim)


;;; Code:

(deftheme mindre
  "Mindre theme.")

(defgroup mindre nil
  "Mindre theme properties."
  :group 'faces)

(eval-and-compile
  (defconst mindre-theme-colors-alist
    '(;; Basic
      (bg-main . "#F5F5F5")
      ;; (fg-main . "#2e3338")
      (fg-main . "#37474f")
      ;; (bg-active . "#f2f3f5")
      (bg-inactive . "#ebeced")
      ;; (black . "#000000")
      ;; (black-alt . "#171A1C")
      (gray . "#CFD8DC")
      (gray-light . "#ECEFF1")
      (gray-silver . "#B0BEC5")
      (purple . "#8408a6")
      (green . "#1a6360")
      (green-faint . "#537469")
      (yellow-dark . "#8a573e")
      (red . "#9E0000")
      (orange . "#d47500"))))

(defmacro mindre-with-color-variables (&rest body)
  (declare (indent 0))
  `(let (,@(mapcar (lambda (cons)
                     (list (car cons) (cdr cons)))
                   mindre-theme-colors-alist))
     ,@body))

(defface mindre-critical nil
  "Critical face for information that requires immediate action."
  :group nil)

(defface mindre-critical-i nil
  "Critical face inversed."
  :group nil)

(defface mindre-bold
  '((t (:bold t :foreground "#000")))
  "Bold face."
  :group nil)

(defface mindre-strong nil
  "Strong face for information of a structural nature."
  :group nil)

(defface mindre-strong-i nil
  "Strong face inversed."
  :group nil)

(defface mindre-keyword nil
  "Default keyword face."
  :group nil)

(defface mindre-type nil
  "Default type face."
  :group nil)

(defface mindre-verbatim nil
  "Face used for things like strings."
  :group nil)

(defface mindre-faded nil
  "Faded face for less important information."
  :group nil)

(defface mindre-faded-i nil
  "Faded face inversed." :group nil)

(defface mindre-subtle nil
  "Subtle face is used to suggest a physical area on the screen."
  :group nil)

(defface mindre-subtle-i nil
  "Subtle face inversed." :group nil)

(defface mindre-default nil
  "Default face." :group nil)

(defface mindre-default-i nil
  "Default face inversed." :group nil)

(defface mindre-highlight nil
  "Default highlight face."
  :group nil)

(defface mindre-warning nil
  "Warning face."
  :group nil)

(defface mindre-error nil
  "Error face."
  :group nil)

(defface mindre-note nil
  "Note face."
  :group nil)

(defface mindre-block nil
  "Default block face."
  :group nil)

(defface mindre-button nil
  "Default button face."
  :group nil)

(defface mindre-button-hover nil
  "Hover button face."
  :group nil)

(defface mindre-button-pressed nil
  "Pressed button face."
  :group nil)

(defface mindre-border nil
  "Border face."
  :group nil)

(defface mindre-bar nil
  "Face used for active mode-line and tab-bar"
  :group nil)

(defface mindre-bar-inactive nil
  "Face used for inactive mode-line and tab-bar"
  :group nil)

(defface mindre-paren-face
  '((t (:foreground "grey70")))
  "Face used to dim parentheses."
  :group nil)

;; set org-checkbox-done-text face
(defface org-checkbox-done-text nil
  "Face for the text part of a checked org-mode checkbox."
  :group nil)

(font-lock-add-keywords 'org-mode
                        '(("\\(^[ \t]*\\(?:[-+*]\\|[0-9]+[).]\\)[ \t]+\\(?:\\[@\\(?:start:\\)?[0-9]+\\][ \t]*\\)?\\[\\(?:X\\|\\([0-9]+\\)/\\2\\)\\][^\n]*\n\\)"
                           1 'org-checkbox-done-text prepend))
                        'append)

;; (font-lock-add-keywords 'org-mode
;;                         '(("\\\\.*?\\({.*?}\\)"
;;                            1 'org-latex-and-related append))
;;                         'append)

(font-lock-add-keywords 'latex-mode
                        '(("\\\\.*?\\({.*?}\\)"
                           1 'org-latex-and-related append))
                        'append)

(defface org-extend-done nil
  "Face for the text part of DONE state."
  :group nil)
(font-lock-add-keywords 'org-mode
                        '(("\\(^\\** DONE .*$\\)"
                           1 'org-extend-done prepend))
                        'append)

(defface org-logbook nil
  "Face for the text part of LOGBOOK drawer."
  :group nil)

;; (font-lock-add-keywords 'org-mode
;;                         '(("\\(?:^:LOGBOOK:$\\)\n\\(\\(?:.*\n\\)*?\\)\\(?:^:END:$\\)" 1 'org-logbook append))
;;                         'append)

(defun org-set-logbook-face ()
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward
            "\\(?:^:LOGBOOK:$\\)\n\\(\\(?:.*\n\\)*?\\)\\(?:^:END:\\)" nil t)
      (overlay-put (make-overlay
                    (match-beginning 0) (match-end 0))
                   'face 'org-logbook))))
(add-hook 'org-mode-hook #'org-set-logbook-face)

;; (font-lock-add-keywords 'org-mode
;;                         '(("\\(\\[\\)[0-9]\\{1,2\\}\\/[0-9]\\{1,2\\}\\(\\]\\)"
;;                            (1 (prog1 () (compose-region (match-beginning 1) (match-end 1) ""))))
;;                           ("\\(\\[\\)[0-9]\\{1,2\\}\\/[0-9]\\{1,2\\}\\(\\]\\)"
;;                            (2 (prog1 () (compose-region (match-beginning 2) (match-end 2) "")))))
;;                         'append)

(font-lock-add-keywords 'org-mode
                        '(("^ *\\(- \\)\\[\\( \\|X\\|-\\)\\]"
                           (1 (prog1 () (compose-region (match-beginning 1) (match-end 1) ""))))))
(font-lock-add-keywords 'org-mode
                        '(("^\\(\\*+\\)\\*"
                           (1 (prog1 () (compose-region (match-beginning 1) (match-end 1) ""))))))
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (1 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([+]\\) "
                           (1 (prog1 () (compose-region (match-beginning 1) (match-end 1) "►"))))))

;; (font-lock-add-keywords 'org-mode
;;                         '(("\\(\\[\\)[0-9]\\{1,3\\}%\\(\\]\\)"
;;                            (1 (prog1 () (compose-region (match-beginning 1) (match-end 1) ""))))
;;                           ("\\(\\[\\)[0-9]\\{1,3\\}%\\(\\]\\)"
;;                            (2 (prog1 () (compose-region (match-beginning 2) (match-end 2) "")))))
;;                         'append)

;;; fix tag alignment in variable-pitch-mode
;;; from https://list.orgmode.org/87lfh745ch.fsf@localhost/T/
(defvar org-ellipsis)
(defun yant/org-align-tags (limit &optional force)
  "Align all the tags in org buffer."
  (save-match-data
    (when (eq major-mode 'org-mode)
      (while (re-search-forward "^\\*+ \\(.+?\\)\\([ \t]+\\)\\(:\\(?:[^ \n]+:\\)+\\)$" limit t)
        (when (and (match-string 2)
                   (or force
                       (not (get-text-property (match-beginning 2) 'org-tag-aligned))))
          (with-silent-modifications
            (put-text-property (match-beginning 2) (match-end 2) 'org-tag-aligned t)
            (put-text-property (if (>= 2 (- (match-end 2) (match-beginning 2)))
                                   (match-beginning 2)
                                 ;; multiple whitespaces may mean that we are in process of typing
                                 (1+ (match-beginning 2)))
                               (match-end 2)
                               'display
                               `(space . (:align-to (- right
                                                       (,(+ 3 ;; no idea, but otherwise it is sometimes not enough
                                                            (string-display-pixel-width org-ellipsis)
                                                            (string-display-pixel-width (or (match-string 3)
                                                                                            ""))))))))))))))

(defun string-display-pixel-width (string &optional mode)
  "Calculate pixel width of STRING.
Optional MODE specifies major mode used for display."
  (with-temp-buffer
    (with-silent-modifications
      (insert string))
    (when (fboundp mode)
      (funcall mode)
      (font-lock-ensure))
    (if (get-buffer-window (current-buffer))
        (car (window-text-pixel-size nil (line-beginning-position) (point)))
      (set-window-buffer nil (current-buffer))
      (car (window-text-pixel-size nil (line-beginning-position) (point))))))
(font-lock-add-keywords 'org-mode '(yant/org-align-tags) t)
;; (add-hook 'org-mode-hook (lambda () (font-lock-add-keywords 'org-mode '(yant/org-align-tags) t)) 100)
(add-hook 'org-mode-hook (lambda () (add-to-list 'font-lock-extra-managed-props 'org-tag-aligned)))

(defun mindre--font-lock-add-paren ()
  "Make Lisp parentheses faded."
  (font-lock-add-keywords nil '(("(\\|)" . 'mindre-paren-face))))

(defvar mindre-after-load-hook nil
  "Hook run after theme has loaded.")

(defcustom mindre-use-more-bold t
  "Use more bold constructs."
  :type 'boolean :group 'mindre)

(defcustom mindre-faded-lisp-parens-modes
  '(emacs-lisp-mode
    lisp-mode
    scheme-mode
    racket-mode)
  "List of modes for which faded parentheses should be enabled."
  :type '(symbol) :group 'mindre)

(defun mindre--set-faded-lisp-parens (_symbol value)
  "Mindre :set function for `mindre-use-faded-lisp-parens'.
Takes care of adding or removing hooks when the
`mindre-use-faded-lisp-parens' variable is customized."
  (let ((hooks (mapcar (lambda (mode) (intern (format "%s-hook" mode)))
                       mindre-faded-lisp-parens-modes)))
    (if value
        (progn
          (dolist (hook hooks)
            (add-hook hook #'mindre--font-lock-add-paren)))
      (dolist (hook hooks)
        (remove-hook hook #'mindre--font-lock-add-paren))))
  (setq mindre-use-faded-lisp-parens value))

(defcustom mindre-use-faded-lisp-parens t
  "Use faded parenthesis in Lisp modes."
  :type 'boolean :group 'mindre
  :initialize #'custom-initialize-reset
  :set #'mindre--set-faded-lisp-parens)

(defface mindre-heading-1 nil
  "Face for headings."
  :group nil)

;; --- Faces ---------------------------------------------------------
(let ((mindre-heading-1-height (if mindre-use-more-bold 1.1 1.0)))

  (mindre-with-color-variables
    (custom-theme-set-faces
     'mindre

     ;; --- Base ---------------------------------------------------------
     `(cursor ((t (:foreground ,bg-main :background ,fg-main))))

     `(default ((t (:background ,bg-main :foreground ,fg-main))))

     `(highlight ((t (:background ,gray))))

     `(mindre-subtle ((t (:background ,gray-light))))

     `(mindre-subtle-i ((t (:foreground ,gray-light))))

     `(mindre-faded ((t (:foreground ,gray-silver))))
     `(mindre-faded-i ((t (:foreground ,bg-main :background ,gray-silver))))

     `(mindre-default ((t (:foreground ,fg-main))))

     `(mindre-default-i ((t (:foreground ,bg-main :background ,fg-main))))

     `(mindre-keyword ((t (:foreground ,purple))))
     `(mindre-type ((t (:foreground ,green))))
     `(mindre-verbatim ((t (:foreground ,yellow-dark))))

     `(mindre-strong ((t ,(when mindre-use-more-bold '(:weight bold)))))
     `(mindre-strong-i ((t (:foreground ,bg-main :background ,fg-main :weight bold))))

     `(mindre-warning ((t (:foreground ,orange))))
     `(mindre-note ((t (:foreground ,green-faint))))
     `(mindre-error ((t (:foreground ,red))))
     `(mindre-critical ((t (:foreground ,red))))
     `(mindre-critical-i ((t (:foreground ,red))))

     `(mindre-heading-1 ((t (:inherit mindre-strong :height ,mindre-heading-1-height))))
     `(mindre-block ((t (:background ,bg-inactive :foreground ,fg-main :extend t))))

     `(mindre-border ((t (:foreground ,gray-light :box (:color ,gray-silver :line-width 1)))))

     `(mindre-bar ((t (:foreground ,fg-main :inherit mindre-border))))
     `(mindre-bar-inactive ((t (:foreground "#535c65" :background ,bg-inactive :inherit mindre-border))))

     `(mindre-button ((t (:box (:style nil) :background ,bg-inactive))))
     `(mindre-button-pressed ((t (:box (:style nil) :background ,bg-inactive))))
     `(mindre-button-hover ((t (:inherit mindre-button :background ,bg-inactive))))

     ;; --- Header & mode line -------------------------------------------
     `(mode-line ((t (:inherit mindre-bar))))
     `(mode-line-inactive ((t (:inherit mindre-bar-inactive))))
     `(mode-line-buffer-id ((t (:weight regular :background unspecified))))
     `(mode-line-emphasis ((t (:weight regular :background unspecified))))
     `(header-line ((t (:inherit mindre-bar :box nil))))

     ;; --- Structural ---------------------------------------------------
     '(bold ((t (:inherit mindre-strong :weight bold))))
     '(italic ((t (:slant italic))))
     '(italic ((t (:inherit mindre-faded))))
     '(bold-italic ((t (:inherit mindre-strong))))
     '(region ((t (:inherit highlight))))
     '(fringe ((t (:inherit mindre-faded))))
     '(hl-line ((t (:inherit mindre-subtle))))
     `(link ((t (:underline (:color ,gray-silver :style line :position 8)))))
     '(underline ((t (:underline (:color foreground-color :style line
                                         :position 8)))))

     ;; --- Semantic -----------------------------------------------------
     '(shadow ((t (:inherit mindre-faded))))
     '(success ((t (:inherit mindre-keyword))))
     '(warning ((t (:inherit mindre-warning))))
     '(error ((t (:inherit mindre-critical))))
     '(match ((t (:inherit (mindre-keyword mindre-bold)))))
     `(preview-face ((t (:inherit mindre-subtle))))

     ;; --- General ------------------------------------------------------
     '(fixed-pitch ((t (:family "Cascadia Mono"))))
     '(variable-pitch ((t (:family "Bookerly"))))
     '(variable-pitch-text ((t (:height 1.0 :inherit variable-pitch))))

     ;; --- General ------------------------------------------------------
     `(fill-column-indicator ((t (:stipple nil :foreground ,gray-light
                                           :inverse-video nil
                                           :box nil
                                           :strike-through nil
                                           :overline nil
                                           :underline nil
                                           :slant normal
                                           :weight bold))))
     '(buffer-menu-buffer ((t (:inherit mindre-strong))))
     '(minibuffer-prompt ((t (:inherit mindre-strong))))
     `(isearch ((t (:inherit (mindre-strong highlight)))))
     '(isearch-fail ((t (:inherit mindre-faded))))
     '(show-paren-match ((t (:foreground "#AB47BC" :weight bold))))
     '(show-paren-mismatch ((t (:inherit mindre-critical))))
     '(lazy-highlight ((t (:inherit mindre-subtle))))
     '(trailing-whitespace ((t (:inherit mindre-subtle))))
     '(secondary-selection ((t (:inherit mindre-subtle))))
     '(completions-annotations ((t (:inherit mindre-faded))))
     '(completions-common-part ((t (:inherit mindre-bold))))
     '(completions-first-difference ((t (:inherit nil))))
     '(tooltip ((t (:inherit mindre-subtle))))
     '(read-multiple-choice-face ((t (:inherit mindre-strong))))
     '(nobreak-hyphen ((t (:inherit mindre-strong))))
     '(nobreak-space ((t (:inherit mindre-strong))))
     '(help-argument-name ((t (:inherit mindre-verbatim))))
     '(help-key-binding ((t :inherit mindre-verbatim)))
     '(tabulated-list-fake-header ((t (:inherit mindre-strong))))
     '(tool-bar ((t (:inherit mindre-faded-i))))

     ;; --- Pulse --------------------------------------------------------
     `(pulse-highlight-face ((t (:inherit highlight))))
     `(pulse-highlight-start-face ((t (:inherit highlight))))

     ;; --- TTY faces ----------------------------------------------------
     '(tty-menu-disabled-face ((t (:inherit mindre-faded-i))))
     '(tty-menu-enabled-face ((t (:inherit mindre-default-i))))
     '(tty-menu-selected-face ((t (:inherit mindre-keyword-i))))

     ;; --- whitespace-mode ----------------------------------------------------
     `(whitespace-space ((t (:inherit mindre-faded))))
     `(whitespace-empty ((t (:inherit mindre-default :foreground ,orange))))
     `(whitespace-newline ((t (:inherit mindre-faded))))

     ;; --- Eshell ----------------------------------------------------
     '(eshell-prompt ((t (:inherit mindre-default))))

     ;; --- ERC ----------------------------------------------------
     '(erc-prompt-face ((t (:inherit mindre-default))))
     '(erc-timestamp-face ((t (:inherit mindre-faded))))
     '(erc-notice-face ((t (:inherit mindre-keyword))))
     '(erc-current-nick-face ((t (:inherit mindre-strong))))
     '(erc-error-face ((t (:inherit mindre-critical-i))))

     ;; --- Dictionary ----------------------------------------------------
     `(dictionary-word-definition-face
       ((t (:inherit (mindre-default fixed-pitch)))))
     `(dictionary-reference-face ((t (:inherit (mindre-keyword fixed-pitch)))))

     ;; --- Windows divider ----------------------------------------------
     `(window-divider ((t (:foreground ,bg-main))))
     '(window-divider-first-pixel ((t (:inherit window-divider))))
     '(window-divider-last-pixel ((t (:inherit window-divider))))
     `(vertical-border ((t (:foreground ,gray-silver))))

     ;; --- Tab bar ------------------------------------------------------
     `(tab-bar ((t (:family "Cascadia Mono" :height 0.9 :inherit default))))
     `(tab-bar-tab ((t (:family "Cascadia Mono" :background "#dde4e6"
                                :box (:line-width (8 . 5)
                                                  :color "#dde4e6"
                                                  :style flat-button)))))
     `(tab-bar-tab-inactive ((t (:family "Cascadia Mono" :foreground ,gray-silver :background ,bg-inactive
                                         :box (:line-width (8 . 5)
                                                           :color ,bg-inactive
                                                           :style flat-button)))))
     '(tab-line ((t (:inherit default))))

     ;; --- Line numbers -------------------------------------------------
     '(line-number ((t (:inherit mindre-faded))))
     '(line-number-current-line ((t (:inherit default))))
     `(line-number-major-tick ((t (:inherit mindre-faded))))
     '(line-number-minor-tick ((t (:inherit mindre-faded))))

     ;; --- Font lock ----------------------------------------------------
     '(font-lock-comment-face ((t (:inherit mindre-faded :slant italic))))
     '(font-lock-doc-face ((t (:inherit mindre-faded))))
     `(font-lock-string-face ((t (:inherit mindre-verbatim))))
     '(font-lock-constant-face ((t (:inherit mindre-strong))))
     `(font-lock-warning-face ((t (:inherit mindre-warning))))
     '(font-lock-function-name-face ((t (:inherit mindre-strong))))
     `(font-lock-variable-name-face ((t (:inherit mindre-default))))
     '(font-lock-builtin-face ((t (:inherit mindre-keyword))))
     '(font-lock-type-face ((t (:inherit mindre-type))))
     '(font-lock-keyword-face ((t (:inherit mindre-keyword))))

     ;; --- Popper -------------------------------------------------------
     `(popper-echo-area-buried ((t (:inherit mindre-default))))
     `(popper-echo-dispatch-hint ((t (:inherit mindre-subtle))))

     ;; --- Custom edit --------------------------------------------------
     '(widget-field ((t (:inherit mindre-subtle))))
     '(widget-button ((t (:inherit mindre-strong))))
     '(widget-single-line-field ((t (:inherit mindre-subtle))))
     '(custom-group-subtitle ((t (:inherit mindre-strong))))
     '(custom-group-tag ((t (:inherit mindre-strong))))
     '(custom-group-tag-1 ((t (:inherit mindre-strong))))
     '(custom-comment ((t (:inherit mindre-faded))))
     '(custom-comment-tag ((t (:inherit mindre-faded))))
     '(custom-changed ((t (:inherit mindre-keyword))))
     '(custom-modified ((t (:inherit mindre-keyword))))
     '(custom-face-tag ((t (:inherit mindre-strong))))
     '(custom-variable-tag ((t (:inherit mindre-strong))))
     '(custom-invalid ((t (:inherit mindre-strong))))
     '(custom-visibility ((t (:inherit mindre-keyword))))
     '(custom-state ((t (:inherit mindre-keyword))))
     '(custom-link ((t (:inherit mindre-keyword))))
     '(custom-variable-obsolete ((t (:inherit mindre-faded))))

     ;; --- Corfu  --------------------------------------------------------
     `(corfu-current ((t (:inherit highlight))))

     ;; --- Vertico  --------------------------------------------------------
     `(vertico-current ((t (:inherit highlight))))

     ;; --- Buttons ------------------------------------------------------
     `(custom-button ((t (:inherit mindre-button))))

     `(custom-button-mouse ((t (:inherit mindre-button-hover))))

     `(custom-button-pressed ((t (:inherit mindre-button-pressed))))

     ;; --- Packages -----------------------------------------------------
     '(package-description ((t (:inherit mindre-default))))
     '(package-help-section-name ((t (:inherit mindre-default))))
     '(package-name ((t (:inherit mindre-keyword))))
     '(package-status-avail-obso ((t (:inherit mindre-faded))))
     '(package-status-available ((t (:inherit mindre-default))))
     '(package-status-built-in ((t (:inherit mindre-keyword))))
     '(package-status-dependency ((t (:inherit mindre-keyword))))
     '(package-status-disabled ((t (:inherit mindre-faded))))
     '(package-status-external ((t (:inherit mindre-default))))
     '(package-status-held ((t (:inherit mindre-default))))
     '(package-status-incompat ((t (:inherit mindre-faded))))
     '(package-status-installed ((t (:inherit mindre-keyword))))
     '(package-status-new ((t (:inherit mindre-default))))
     '(package-status-unsigned ((t (:inherit mindre-default))))

     ;; --- Info ---------------------------------------------------------
     '(info-node ((t (:inherit mindre-strong))))
     '(info-menu-header ((t (:inherit mindre-strong))))
     '(info-header-node ((t (:inherit mindre-default))))
     '(info-index-match ((t (:inherit mindre-keyword))))
     '(info-menu-star ((t (:inherit mindre-default))))
     '(Info-quoted ((t (:inherit mindre-keyword))))
     '(info-title-1 ((t (:height 1.5 :inherit mindre-strong))))
     '(info-title-2 ((t (:height 1.3 :inherit mindre-strong))))
     '(info-title-3 ((t (:height 1.2 :inherit mindre-strong))))
     '(info-title-4 ((t (:inherit mindre-strong))))

     ;; --- Info-colors --------------------------------------------------
     '(info-colors-ref-item-variable ((t (:inherit mindre-verbatim))))
     '(info-colors-ref-item-user-option ((t (:inherit mindre-verbatim))))

     ;; --- Helpful ------------------------------------------------------
     '(helpful-heading ((t (:height 1.2 :inherit mindre-strong))))

     ;; --- EPA ----------------------------------------------------------
     '(epa-field-body ((t (:inherit mindre-default))))
     '(epa-field-name ((t (:inherit mindre-strong))))
     '(epa-mark ((t (:inherit mindre-keyword))))
     '(epa-string ((t (:inherit mindre-strong))))
     '(epa-validity-disabled ((t (:inherit mindre-faded))))
     '(epa-validity-high ((t (:inherit mindre-strong))))
     '(epa-validity-medium ((t (:inherit mindre-default))))
     '(epa-validity-low ((t (:inherit mindre-faded))))

     ;; --- Dired --------------------------------------------------------
     '(dired-header ((t (:inherit mindre-keyword))))
     '(dired-directory ((t (:inherit (mindre-bold)))))
     `(dired-symlink ((t (:slant italic))))
     '(dired-marked ((t (:inherit mindre-keyword))))
     `(dired-flagged ((t (:inherit mindre-critical-i))))
     `(dired-broken-symlink ((t (:slant italic :strike-through ,red))))

     ;; --- Diredfl ------------------------------------------------------
     '(diredfl-date-time ((t (:inherit mindre-faded))))
     '(diredfl-deletion-file-name ((t (:inherit mindre-critical))))
     '(diredfl-dir-priv ((t (:inherit mindre-faded))))
     '(diredfl-exec-priv ((t (:inherit mindre-faded))))
     '(diredfl-file-suffix ((t (:inherit mindre-default))))
     '(diredfl-flag-mark-line ((t (:inherit mindre-keyword))))
     '(diredfl-number ((t (:foreground "#B0BEC5" :inherit mindre-faded))))
     '(diredfl-read-priv ((t (:inherit mindre-faded))))
     '(diredfl-user ((t (:inherit mindre-faded))))
     '(diredfl-write-priv ((t (:inherit mindre-faded))))
     '(diredfl-rare-priv ((t (:inherit mindre-faded))))

     `(diredfl-dir-heading ((t (:inherit mindre-keyword))))
     `(diredfl-file-name ((t (:inherit mindre-default))))
     `(diredfl-no-priv ((t (:inherit mindre-faded))))
     `(diredfl-dir-name ((t (:inherit mindre-bold))))
     `(diredfl-deletion ((t (:inherit (mindre-critical-i mindre-bold)))))
     `(diredfl-ignored-file-name ((t (:inherit mindre-faded))))
     `(diredfl-flag-mark ((t (:background ,bg-inactive))))
     `(diredfl-symlink ((t (:slant italic))))
     `(diredfl-rare-priv ((t (:inherit mindre-default :slant italic))))
     `(diredfl-compressed-file-name ((t (:inherit mindre-faded))))
     `(diredfl-compressed-extensions ((t (:inherit mindre-faded))))
     `(diredfl-compressed-file-suffix ((t (:inherit mindre-faded))))
     ;; TODO: I don't know what these are..
     `(diredfl-link-priv ((t (:foreground ,orange))))
     ;; `(diredfl-other-priv ((t ())))
     `(diredfl-tagged-autofile-name ((t (:background "#c6dad3"))))

     ;; --- Eglot --------------------------------------------------------
     `(eglot-mode-line ((t (:foreground ,fg-main))))
     `(eglot-mode-line-none-face ((t (:foreground ,fg-main))))
     '(eglot-highlight-symbol-face ((t (:inherit underline))))

     ;; --- Eww ----------------------------------------------------
     `(eww-form-submit ((t (:box (:style released-button)
                                 :background ,bg-inactive))))

     ;; --- Keycast ------------------------------------------------------
     `(keycast-key ((t :inherit nil :bold t)))
     `(keycast-command ((t :inherit mindre-default)))

     ;; --- Popup --------------------------------------------------------
     '(popup-face ((t (:inherit highlight))))
     '(popup-isearch-match ((t (:inherit mindre-strong))))
     '(popup-menu-face ((t (:inherit mindre-subtle))))
     '(popup-menu-mouse-face ((t (:inherit mindre-faded-i))))
     '(popup-menu-selection-face ((t (:inherit mindre-keyword-i))))
     '(popup-menu-summary-face ((t (:inherit mindre-faded))))
     '(popup-scroll-bar-background-face ((t (:inherit mindre-subtle))))
     '(popup-scroll-bar-foreground-face ((t (:inherit mindre-subtle))))
     '(popup-summary-face ((t (:inherit mindre-faded))))
     '(popup-tip-face ((t (:inherit mindre-strong-i))))

     ;; --- Diff ---------------------------------------------------------
     '(diff-header ((t (:inherit mindre-faded))))
     '(diff-file-header ((t (:inherit mindre-strong))))
     '(diff-context ((t (:inherit mindre-default))))
     '(diff-removed ((t (:inherit mindre-faded))))
     '(diff-changed ((t (:inherit mindre-strong))))
     '(diff-added ((t (:inherit mindre-keyword))))
     '(diff-refine-added ((t (:inherit (mindre-keyword mindre-strong)))))
     '(diff-refine-changed ((t (:inherit mindre-strong))))
     '(diff-refine-removed ((t (:inherit mindre-faded :strike-through t))))

     ;; --- Message ------------------------------------------------------
     '(message-cited-text-1 ((t (:inherit mindre-faded))))
     '(message-cited-text-2 ((t (:inherit mindre-faded))))
     '(message-cited-text-3 ((t (:inherit mindre-faded))))
     '(message-cited-text-4 ((t (:inherit mindre-faded))))
     '(message-cited-text ((t (:inherit mindre-faded))))
     '(message-header-cc ((t (:inherit mindre-default))))
     '(message-header-name ((t (:inherit mindre-strong))))
     '(message-header-newsgroups ((t (:inherit mindre-default))))
     '(message-header-other ((t (:inherit mindre-default))))
     '(message-header-subject ((t (:inherit mindre-keyword))))
     '(message-header-to ((t (:inherit mindre-keyword))))
     '(message-header-xheader ((t (:inherit mindre-default))))
     '(message-mml ((t (:inherit mindre-strong))))
     '(message-separator ((t (:inherit mindre-faded))))

     ;; --- Outline ------------------------------------------------------
     '(outline-1 ((t (:inherit mindre-strong))))
     '(outline-2 ((t (:inherit mindre-strong))))
     '(outline-3 ((t (:inherit mindre-strong))))
     '(outline-4 ((t (:inherit mindre-strong))))
     '(outline-5 ((t (:inherit mindre-strong))))
     '(outline-6 ((t (:inherit mindre-strong))))
     '(outline-7 ((t (:inherit mindre-strong))))
     '(outline-8 ((t (:inherit mindre-strong))))

     ;; --- Orderless ------------------------------------------------------
     '(orderless-match-face-0 ((t (:inherit mindre-bold))))
     '(orderless-match-face-1 ((t (:inherit mindre-bold))))
     '(orderless-match-face-2 ((t (:inherit mindre-bold))))
     '(orderless-match-face-3 ((t (:inherit mindre-bold))))

     ;; --- Flyspell ----------------------------------------------------
     '(flyspell-duplicate ((t (:inherit mindre-warning))))
     `(flyspell-incorrect ((t (:underline (:style wave :color ,red)))))

     ;; --- Flymake ----------------------------------------------------
     `(flymake-error ((t (:underline (:style wave :color ,red)))))
     `(flymake-warning ((t (:underline (:style wave :color ,orange)))))
     `(flymake-note ((t (:underline (:style wave :color ,green-faint)))))
     `(compilation-error ((t (:inherit mindre-error))))
     `(compilation-warning ((t (:foreground ,orange))))
     `(compilation-mode-line-run ((t (:inherit mindre-foreground))))

     ;; --- Flycheck ----------------------------------------------------
     `(flycheck-error ((t (:underline (:style wave :color ,red)))))
     `(flycheck-warning ((t (:underline (:style wave :color ,orange)))))
     `(flycheck-info ((t (:underline (:style wave :color ,green-faint)))))

     ;; --- Org agenda ---------------------------------------------------
     '(org-agenda-calendar-event ((t (:inherit mindre-default))))
     '(org-agenda-calendar-sexp ((t (:inherit mindre-keyword))))
     '(org-agenda-clocking ((t (:inherit mindre-verbatim))))
     '(org-agenda-column-dateline ((t (:inherit mindre-faded))))
     '(org-agenda-current-time ((t (:inherit mindre-strong))))
     '(org-agenda-date ((t (:inherit mindre-keyword))))
     '(org-agenda-date-today ((t (:inherit (mindre-keyword mindre-strong)))))
     '(org-agenda-date-weekend ((t (:inherit mindre-faded))))
     '(org-agenda-diary ((t (:inherit mindre-faded))))
     '(org-agenda-dimmed-todo-face ((t (:inherit mindre-faded))))
     '(org-agenda-done ((t (:inherit mindre-faded))))
     '(org-agenda-filter-category ((t (:inherit mindre-faded))))
     '(org-agenda-filter-effort ((t (:inherit mindre-faded))))
     '(org-agenda-filter-regexp ((t (:inherit mindre-faded))))
     '(org-agenda-filter-tags ((t (:inherit mindre-faded))))
     '(org-agenda-property-face ((t (:inherit mindre-faded))))
     '(org-agenda-restriction-lock ((t (:inherit mindre-faded))))
     '(org-agenda-structure ((t (:inherit mindre-strong))))
     `(org-dispatcher-highlight ((t (:inherit mindre-keyword :bold t))))
     '(org-habit-overdue-face ((t (:weight bold :background "#eaa39c"))))
     '(org-habit-ready-face ((t (:weight bold :background "#98b3f1"))))
     '(org-habit-alert-future-face ((t (:weight bold :background "#d5c7a8"))))

     ;; --- Org ----------------------------------------------------------
     '(org-extend-done ((t (:inherit mindre-faded))))
     '(org-logbook ((t (:inherit fixed-pitch))))
     '(org-archived ((t (:inherit mindre-faded))))
     '(org-block ((t (:inherit mindre-block))))
     '(org-code ((t (:extend nil :inherit mindre-block))))
     ;; '(org-code ((t (:background "#e7e7e7"))))
     '(org-block-begin-line ((t (:slant italic :background unspecified
                                        :foreground unspecified :inherit nil))))
     '(org-block-end-line ((t (:background unspecified :foreground unspecified :inherit nil))))
     '(org-checkbox ((t (:inherit (mindre-default)))))
     '(org-checkbox-undone-test ((t (:inherit (mindre-default)))))
     '(org-checkbox-done-text ((t (:inherit (mindre-faded)))))
     '(org-checkbox-statistics-done ((t (:height 0.6 :inherit mindre-faded))))
     '(org-checkbox-statistics-todo ((t (:height 0.6 :foreground "dim gray"
                                                 :inherit mindre-default))))
     '(org-ellipsis ((t (:height 0.4 :inherit mindre-faded))))
     '(org-clock-overlay ((t (:inherit mindre-faded))))
     '(org-column ((t (:inherit mindre-faded))))
     '(org-column-title ((t (:inherit mindre-faded))))
     '(org-date ((t (:inherit mindre-faded))))
     '(org-date-selected ((t (:inherit mindre-faded))))
     '(org-default ((t (:inherit mindre-faded))))
     '(org-document-info ((t (:inherit mindre-faded))))
     '(org-document-info-keyword ((t (:inherit (mindre-faded fixed-pitch)))))
     '(org-document-title ((t (:inherit mindre-strong :weight semibold))))
     '(org-done ((t (:height 1.0 :inherit mindre-faded))))
     '(org-drawer ((t (:inherit (mindre-faded fixed-pitch)))))
     '(org-footnote ((t (:inherit mindre-faded))))
     '(org-formula ((t (:inherit mindre-faded))))
     '(org-headline-done ((t (:inherit mindre-faded))))
     '(org-headline-todo ((t (:inherit mindre-default))))
     '(org-hide ((t (:inherit mindre-subtle-i))))
     '(org-indent ((t (:inherit mindre-subtle-i))))
     `(org-latex-and-related ((t (:inherit (mindre-default)
                                           :background ,bg-main))))
     `(org-level-1 ((t (:height 1.15 :inherit (variable-pitch mindre-strong)))))
     `(org-level-2 ((t (:height 1.1 :inherit (variable-pitch mindre-strong)))))
     `(org-level-3 ((t (:height 1.05 :inherit (variable-pitch mindre-strong)))))
     `(org-level-4 ((t (:height 1.0  :inherit (variable-pitch mindre-strong)))))
     `(org-level-5 ((t (:inherit (variable-pitch mindre-strong)))))
     `(org-level-6 ((t (:inherit (variable-pitch mindre-strong)))))
     `(org-level-7 ((t (:inherit (variable-pitch mindre-strong)))))
     `(org-level-8 ((t (:inherit (variable-pitch mindre-strong)))))
     `(org-link ((t (:inherit link))))
     '(org-list-dt ((t (:inherit mindre-keyword))))
     '(org-macro ((t (:inherit mindre-faded))))
     '(org-meta-line ((t (:inherit (mindre-faded fixed-pitch) :height 0.9))))
     '(org-mode-line-clock ((t (:inherit mindre-faded))))
     '(org-mode-line-clock-overrun ((t (:inherit mindre-faded))))
     '(org-priority ((t (:inherit mindre-faded))))
     '(org-property-value ((t (:inherit (mindre-faded fixed-pitch)))))
     '(org-quote ((t (:inherit mindre-faded :slant italic))))
     '(org-scheduled ((t (:inherit mindre-faded))))
     '(org-scheduled-previously ((t (:inherit mindre-default))))
     '(org-scheduled-today ((t (:inherit mindre-default))))
     '(org-sexp-date ((t (:inherit mindre-faded))))
     '(org-special-keyword ((t (:inherit (mindre-faded fixed-pitch)))))
     '(org-table ((t (:inherit (mindre-default fixed-pitch)))))
     '(org-tag ((t (:inherit mindre-faded))))
     '(org-tag-group ((t (:inherit mindre-faded))))
     '(org-target ((t (:inherit mindre-faded))))
     '(org-time-grid ((t (:inherit mindre-faded))))
     '(org-todo ((t (:height 1.0 :inherit (mindre-keyword mindre-strong)))))
     '(org-upcoming-deadline ((t (:inherit mindre-default))))
     '(org-verbatim ((t (:inherit (mindre-verbatim)))))
     '(org-verse ((t (:inherit mindre-faded))))
     '(org-warning ((t (:inherit mindre-strong))))

     ;; --- Org superstar ------------------------------------------------
     '(org-superstar-header-bullet ((t (:height 0.9))))

     ;; --- Mu4e ---------------------------------------------------------
     '(mu4e-attach-number-face ((t (:inherit mindre-strong))))
     '(mu4e-cited-1-face ((t (:inherit mindre-faded))))
     '(mu4e-cited-2-face ((t (:inherit mindre-faded))))
     '(mu4e-cited-3-face ((t (:inherit mindre-faded))))
     '(mu4e-cited-4-face ((t (:inherit mindre-faded))))
     '(mu4e-cited-5-face ((t (:inherit mindre-faded))))
     '(mu4e-cited-6-face ((t (:inherit mindre-faded))))
     '(mu4e-cited-7-face ((t (:inherit mindre-faded))))
     '(mu4e-compose-header-face ((t (:inherit mindre-faded))))
     '(mu4e-compose-separator-face ((t (:inherit mindre-faded))))
     '(mu4e-contact-face ((t (:inherit mindre-keyword))))
     '(mu4e-context-face ((t (:inherit mindre-faded))))
     '(mu4e-draft-face ((t (:inherit mindre-faded))))
     '(mu4e-flagged-face ((t (:inherit mindre-note :weight bold))))
     '(mu4e-footer-face ((t (:inherit mindre-faded))))
     '(mu4e-forwarded-face ((t (:inherit mindre-default))))
     '(mu4e-header-face ((t (:inherit mindre-faded))))
     '(mu4e-related-face ((t (:strike-through t :inherit mindre-faded))))
     '(mu4e-header-highlight-face ((t (:inherit highlight))))
     '(mu4e-header-key-face ((t (:inherit mindre-strong))))
     '(mu4e-header-marks-face ((t (:inherit mindre-faded))))
     '(mu4e-header-title-face ((t (:inherit mindre-strong))))
     '(mu4e-header-value-face ((t (:inherit mindre-default))))
     '(mu4e-highlight-face ((t (:inherit mindre-strong))))
     '(mu4e-link-face ((t (:inherit mindre-keyword))))
     '(mu4e-modeline-face ((t (:inherit mindre-faded))))
     '(mu4e-moved-face ((t (:inherit mindre-faded))))
     '(mu4e-ok-face ((t (:inherit mindre-faded))))
     '(mu4e-region-code ((t (:inherit mindre-faded))))
     '(mu4e-replied-face ((t (:inherit mindre-note))))
     '(mu4e-special-header-value-face ((t (:inherit mindre-default))))
     '(mu4e-system-face ((t (:inherit mindre-faded))))
     '(mu4e-title-face ((t (:inherit mindre-strong))))
     '(mu4e-trashed-face ((t (:inherit mindre-faded))))
     '(mu4e-unread-face ((t (:inherit mindre-strong))))
     '(mu4e-url-number-face ((t (:inherit mindre-faded))))
     '(mu4e-view-body-face ((t (:inherit mindre-default))))
     '(mu4e-warning-face ((t (:inherit mindre-strong))))

     ;; --- Notmuch -------------------------------------------------------
     `(notmuch-crypto-decryption ((t (:inherit mindre-strong))))
     `(notmuch-crypto-part-header ((t (:inherit mindre-strong))))
     `(notmuch-crypto-signature-bad ((t (:inherit mindre-error))))
     `(notmuch-crypto-signature-good ((t (:inherit mindre-note))))
     `(notmuch-crypto-signature-good-key ((t (:inherit mindre-note))))
     `(notmuch-crypto-signature-unknown ((t (:inherit mindre-warning))))
     `(notmuch-search-count ((t (:inherit mindre-faded))))
     `(notmuch-search-unread-face ((t (:weight semibold))))
     `(notmuch-search-date ((t (:inherit mindre-default))))
     `(notmuch-search-matching-authors ((t (:inherit mindre-keyword))))
     `(notmuch-search-non-matching-authors ((t (:inherit mindre-faded))))
     `(notmuch-search-subject ((t (:inherit mindre-default))))
     `(notmuch-tag-added ((t (:inherit mindre-verbatim :underline t))))
     `(notmuch-tag-deleted ((t (:inherit mindre-verbatim :strike-through t))))
     `(notmuch-tag-face ((t (:inherit mindre-verbatim))))
     `(notmuch-tag-flagged ((t (:inherit mindre-strong))))
     `(notmuch-tag-unread ((t (:inherit mindre-strong))))
     `(notmuch-tree-match-author-face ((t (:inherit mindre-keyword))))
     `(notmuch-tree-match-subject-face ((t (:inherit mindre-default))))
     `(notmuch-tree-match-date-face ((t (:inherit mindre-default))))
     `(notmuch-tree-match-tag-face ((t (:inherit mindre-verbatim))))
     `(notmuch-tree-no-match-face ((t (:inherit mindre-faded))))
     `(notmuch-tree-no-match-date-face ((t (:inherit mindre-default))))

     ;; --- Elfeed -------------------------------------------------------
     '(elfeed-log-date-face ((t (:inherit mindre-faded))))
     '(elfeed-log-info-level-face ((t (:inherit mindre-default))))
     '(elfeed-log-debug-level-face ((t (:inherit mindre-default))))
     '(elfeed-log-warn-level-face ((t (:inherit mindre-strong))))
     '(elfeed-log-error-level-face ((t (:inherit mindre-strong))))
     '(elfeed-search-tag-face ((t (:inherit mindre-faded))))
     '(elfeed-search-date-face ((t (:inherit mindre-default))))
     '(elfeed-search-feed-face ((t (:inherit mindre-keyword))))
     '(elfeed-search-filter-face ((t (:inherit mindre-faded))))
     '(elfeed-search-last-update-face ((t (:inherit mindre-keyword))))
     '(elfeed-search-title-face ((t (:inherit mindre-faded))))
     `(elfeed-search-unread-count-face ((t (:inherit mindre-strong
                                                     :foreground ,fg-main))))
     `(elfeed-search-unread-title-face ((t (:inherit mindre-strong
                                                     :foreground ,fg-main))))

     ;; --- Rainbow delimeters ------------------------------------------
     '(rainbow-delimiters-depth-1-face ((t (:foreground "#b9bbbc"))))
     '(rainbow-delimiters-depth-2-face ((t (:foreground "#a2a4a6"))))
     '(rainbow-delimiters-depth-3-face ((t (:foreground "#8b8e90"))))
     '(rainbow-delimiters-depth-4-face ((t (:foreground "#737779"))))
     '(rainbow-delimiters-depth-5-face ((t (:foreground "#5c6063"))))
     '(rainbow-delimiters-depth-6-face ((t (:foreground "#45494d"))))
     '(rainbow-delimiters-depth-7-face ((t (:foreground "#2d3336"))))
     '(rainbow-delimiters-depth-8-face ((t (:inherit mindre-strong))))
     '(rainbow-delimiters-depth-9-face ((t (:inherit mindre-strong))))
     '(rainbow-delimiters-depth-10-face ((t (:inherit mindre-strong))))
     '(rainbow-delimiters-depth-11-face ((t (:inherit mindre-strong))))
     '(rainbow-delimiters-depth-12-face ((t (:inherit mindre-strong))))

     ;; --- Deft --------------------------------------------------------
     '(deft-filter-string-error-face ((t (:inherit mindre-strong))))
     '(deft-filter-string-face ((t (:inherit mindre-default))))
     '(deft-header-face ((t (:inherit mindre-keyword))))
     '(deft-separator-face ((t (:inherit mindre-faded))))
     '(deft-summary-face ((t (:inherit mindre-faded))))
     '(deft-time-face ((t (:inherit mindre-keyword))))
     '(deft-title-face ((t (:inherit mindre-strong))))

     ;; --- Restructured text -------------------------------------------
     '(rst-adornment ((t (:inherit mindre-faded))))
     '(rst-block ((t (:inherit mindre-default))))
     '(rst-comment ((t (:inherit mindre-faded))))
     '(rst-definition ((t (:inherit mindre-keyword))))
     '(rst-directive ((t (:inherit mindre-keyword))))
     '(rst-emphasis1 ((t (:inherit mindre-faded))))
     '(rst-emphasis2 ((t (:inherit mindre-strong))))
     '(rst-external ((t (:inherit mindre-keyword))))
     '(rst-level-1 ((t (:inherit mindre-strong))))
     '(rst-level-2 ((t (:inherit mindre-strong))))
     '(rst-level-3 ((t (:inherit mindre-strong))))
     '(rst-level-4 ((t (:inherit mindre-strong))))
     '(rst-level-5 ((t (:inherit mindre-strong))))
     '(rst-level-6 ((t (:inherit mindre-strong))))
     '(rst-literal ((t (:inherit mindre-keyword))))
     '(rst-reference ((t (:inherit mindre-keyword))))
     '(rst-transition ((t (:inherit mindre-default))))

     ;; --- Markdown ----------------------------------------------------
     `(markdown-code-face ((t nil)))
     '(markdown-metadata-key-face ((t (:inherit mindre-faded))))
     '(markdown-metadata-value-face ((t (:inherit mindre-faded))))
     ;; '(markdown-blockquote-face ((t (:inherit mindre-default))))
     ;; '(markdown-bold-face ((t (:inherit mindre-strong))))
     ;; `(markdown-code-face ((t (:inherit (fixed-pitch mindre-block)))))
     ;; '(markdown-comment-face ((t (:inherit mindre-faded))))
     ;; '(markdown-footnote-marker-face ((t (:inherit mindre-default))))
     ;; '(markdown-footnote-text-face ((t (:inherit mindre-default))))
     ;; '(markdown-gfm-checkbox-face ((t (:inherit mindre-default))))
     ;; '(markdown-header-delimiter-face ((t (:inherit mindre-faded))))
     ;; '(markdown-header-face ((t (:inherit (mindre-strong mindre-heading-1)))))
     ;; '(markdown-header-face-1 ((t (:inherit (mindre-strong mindre-heading-1)))))
     ;; '(markdown-header-face-2 ((t (:inherit (mindre-strong mindre-heading-1)))))
     ;; '(markdown-header-face-3 ((t (:inherit (mindre-strong mindre-heading-1)))))
     ;; '(markdown-header-face-4 ((t (:inherit (mindre-strong mindre-heading-1)))))
     ;; '(markdown-header-face-5 ((t (:inherit (mindre-strong mindre-heading-1)))))
     ;; '(markdown-header-face-6 ((t (:inherit (mindre-strong mindre-heading-1)))))
     ;; '(markdown-header-rule-face ((t (:inherit mindre-default))))
     ;; '(markdown-highlight-face ((t (:inherit mindre-default))))
     ;; '(markdown-hr-face ((t (:inherit mindre-default))))
     ;; '(markdown-html-attr-name-face ((t (:inherit mindre-default))))
     ;; '(markdown-html-attr-value-face ((t (:inherit mindre-default))))
     ;; '(markdown-html-entity-face ((t (:inherit mindre-default))))
     ;; '(markdown-html-tag-delimiter-face ((t (:inherit mindre-default))))
     ;; '(markdown-html-tag-name-face ((t (:inherit mindre-default))))
     ;; '(markdown-inline-code-face ((t (:inherit (fixed-pitch mindre-strong)))))
     ;; '(markdown-italic-face ((t (:inherit mindre-faded))))
     ;; '(markdown-language-info-face ((t (:inherit mindre-default))))
     ;; '(markdown-language-keyword-face ((t (:inherit mindre-faded))))
     ;; '(markdown-line-break-face ((t (:inherit mindre-default))))
     ;; '(markdown-link-face ((t (:inherit mindre-keyword))))
     ;; '(markdown-link-title-face ((t (:inherit mindre-default))))
     ;; '(markdown-list-face ((t (:inherit mindre-default))))
     ;; '(markdown-markup-face ((t (:inherit mindre-faded))))
     ;; '(markdown-math-face ((t (:inherit mindre-default))))
     ;; '(markdown-missing-link-face ((t (:inherit mindre-default))))
     ;; '(markdown-plain-url-face ((t (:inherit mindre-default))))
     ;; `(markdown-pre-face ((t (:inherit mindre-subtle :extend t :inherit fixed-pitch))))
     ;; '(markdown-reference-face ((t (:inherit mindre-keyword))))
     ;; '(markdown-strike-through-face ((t (:inherit mindre-faded))))
     ;; '(markdown-table-face ((t (:inherit mindre-default))))
     ;; '(markdown-url-face ((t (:inherit mindre-keyword))))

     ;; --- Terminal ----------------------------------------------------
     '(term-bold ((t (:inherit mindre-strong))))
     '(term-color-black ((t (:inherit default))))
     '(term-color-blue ((t (:inherit default))))
     '(term-color-cyan ((t (:inherit default))))
     '(term-color-green ((t (:inherit mindre-note))))
     '(term-color-magenta ((t (:foreground "#5e429f" :background "#5e429f "))))
     '(term-color-red ((t (:foreground "#C74B50" :background "#C74B50 "))))
     '(term-color-yellow ((t (:foreground "#d47500" :background "#F8B400"))))

     ;; --- Haskell ----------------------------------------------------
     `(haskell-constructor-face ((t (:inherit mindre-type))))
     `(haskell-pragma-face ((t (:inherit font-lock-comment-face))))
     `(haskell-operator-face ((t (:inherit mindre-default))))

     ;; --- Nix ----------------------------------------------------
     `(nix-attribute-face ((t (:inherit mindre-default))))

     ;; --- Sh ----------------------------------------------------
     `(sh-quoted-exec ((t (:inherit mindre-type))))

     ;; --- LaTeX ----------------------------------------------------
     `(font-latex-math-face ((t (:inherit (mindre-default fixed-pitch)))))
     `(font-latex-bold-face ((t (:inherit bold))))
     `(font-latex-warning-face ((t (:inherit (mindre-note fixed-pitch)))))
     `(font-latex-script-char-face ((t (:inherit mindre-default))))
     `(font-latex-sectioning-2-face ((t (:inherit bold :height 1.4))))

     ;; --- Geiser ----------------------------------------------------
     `(geiser-font-lock-autodoc-current-arg ((t :inherit mindre-verbatim)))
     `(geiser-font-lock-autodoc-identifier ((t :inherit mindre-keyword)))

     ;; --- powierline ------------------------------------------------
     '(powerline-active1 ((t (:inherit mode-line))))
     '(powerline-active2 ((t (:inherit mode-line))))

     ;; ---- ledger ------------------------------------------------------
     '(ledger-font-posting-date-face ((t (:foreground "#8a573e"))))

     ;; ---- rime -----------------------------------------------------
     '(rime-indicator-dim-face ((t (:inherit mindre-faded))))
     '(rime-indicator-face ((t (:inherit (mindre-keyword mindre-strong)))))

     ;; ---- ibuffer --------------------------------------------------
     '(all-the-icons-ibuffer-mode-face ((t (:inherit mindre-faded))))

     ;; ---- popper --------------------------------------------------
     '(popper-echo-area ((t (:inherit mindre-keyword))))

     '(magit-branch-current ((t :inherit mindre-keyword :weight bold)))

     `(markmacro-mark-face ((t (:background "lightblue"))))

     '(embark-selected ((t (:background "lightblue"))))
     '(marginalia-off ((t (:inherit mindre-faded))))
     '(marginalia-type ((t (:inherit mindre-faded))))
     '(marginalia-value ((t (:inherit mindre-faded))))

     ;; --- Racket ----------------------------------------------------
     `(racket-keyword-argument-face ((t (:inherit mindre-keyword))))

     '(pdf-view-pagemark-color ((t (:background "#ffffaa"))))
     )))

;;;###autoload
(when (and (boundp 'custom-theme-load-path) load-file-name)
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

;;;###autoload
(run-hooks 'mindre-after-load-hook)

(provide-theme 'mindre)

;;; mindre-theme.el ends here
