;;==============================================================================
;; File: init.el
;; Author: Alan Calazans <alancalazans@hotmail.com.br>
;; Last Update: dom 20 Set 2020 17:38:00 BRT
;; Created: dom 20 Set 2020 17:38:00 BRT
;; License: GNU General Public License v3
;;          <http://www.gnu.org/licenses/gpl.html>
;; Version: 1.0
;;==============================================================================

;;******************************************************************************
;; ## Customização pessoal
;;******************************************************************************

;;==============================================================================
;; ## Remover boas vindas
(setq inhibit-startup-message t)

;;==============================================================================
;; ## Remover Menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;;==============================================================================
;; ## Remover barra de rolagem
;;(scroll-bar-mode -1)

;;==============================================================================
;; ## Rolamento suave
(setq smooth-scroll-margin 5)

;;==============================================================================
;; ## Numeros nas linhas
(global-linum-mode t)

;;==============================================================================
;; ## Tamanho da fonte
(set-face-attribute 'default nil :height 110)

;;==============================================================================
;; ## Tipo e tamanho da fonte do editor.
;;(set-default-font "Ubuntu Mono-13")
;;(set-default-font "Monospace-12")
;;(set-default-font "Consolas-11")

;;==============================================================================
;; ## Adiciona nova linha ao final do arquivo
;;(setq require-final-newline t)

;;==============================================================================
;; ## Inicia Emacs com ctrl-{zxcv} abilitado para desfazer/recortar/copiar/colar
(cua-mode t)

;;==============================================================================
;; ## Tamanho da janela
(setq initial-frame-alist
	'(
		(width . 100)
		(height . 25)
	 )
)

;;==============================================================================
;; ## Tab ident
(setq-default indent-tabs-mode t)
(setq tabify t)
(setq c-basic-offset 2)
(setq-default js2-basic-offset 2)

; START TABS CONFIG
;; Create a variable for our preferred tab width
(setq custom-tab-width 2)

;; Two callable functions for enabling/disabling tabs in Emacs
(defun disable-tabs () (setq indent-tabs-mode nil))
(defun enable-tabs  ()
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (setq indent-tabs-mode t)
  (setq tab-width custom-tab-width))

;; Hooks to Enable Tabs
(add-hook 'prog-mode-hook 'enable-tabs)
;; Hooks to Disable Tabs
(add-hook 'lisp-mode-hook 'disable-tabs)
(add-hook 'emacs-lisp-mode-hook 'disable-tabs)

;; Language-Specific Tweaks
(setq-default python-indent-offset custom-tab-width) ;; Python
(setq-default js-indent-level custom-tab-width)      ;; Javascript

;; Making electric-indent behave sanely
(setq-default electric-indent-inhibit t)

;; Make the backspace properly erase the tab instead of
;; removing 1 space at a time.
(setq backward-delete-char-untabify-method 'hungry)

;; (OPTIONAL) Shift width for evil-mode users
;; For the vim-like motions of ">>" and "<<".
(setq-default evil-shift-width custom-tab-width)

;; WARNING: This will change your life
;; (OPTIONAL) Visualize tabs as a pipe character - "|"
;; This will also show trailing characters as they are useful to spot.
(setq whitespace-style '(face tabs tab-mark trailing))
(custom-set-faces
 '(whitespace-tab ((t (:foreground "#636363")))))
(setq whitespace-display-mappings
  '((tab-mark 9 [124 9] [92 9]))) ; 124 is the ascii ID for '\|'
(global-whitespace-mode) ; Enable whitespace mode everywhere
; END TABS CONFIG

;;==============================================================================
;; ## Definindo paradas de tabulação manualmente
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82))

;;==============================================================================
;; ## Activar a roda do mouse
(mwheel-install)

;;==============================================================================
;; ## Tornar todas as perguntas "yes/no" em y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;==============================================================================
;; ## Habilita compartilhamento de área de transferência com outros
;; ## aplicativos.
;;(setq x-select-enable-clipboard t)

;;==============================================================================
;; ## Desativa o auto salvar e auto backup.
(setq auto-save-default nil) ;; Para o #autosave#.
(setq make-backup-files nil) ;; Para o backup~.

;;==============================================================================
;; ## Nossos atalhos
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;;==============================================================================
;; ## Limpando espaços em branco nos finais das linhas
(global-set-key (kbd "C-l") 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;******************************************************************************
;; ## MELPA - configuração
;;******************************************************************************

;;==============================================================================
;; ## Pacotes
(require 'package)
(setq package-enable-at-startup nil) ;; desabilitar inicio de ativação

;;==============================================================================
;; ## Melpa - repositório
(add-to-list 'package-archives
	'("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize) ;; iniciar pacotes

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

;;******************************************************************************
;; ## Pacotes - via MELPA
;;******************************************************************************

;;==============================================================================
;; ## Ergoemacs - Instalação via MELPA
;;(use-package ergoemacs-mode
;;	:ensure t
;;	:config
;;	(progn
;;		(setq ergoemacs-theme nil)
;;		(setq ergoemacs-keyboard-layout "us")
;;		(ergoemacs-mode-1)))

;;==============================================================================
;; ## Para testar pacotes sem instalar
(use-package try
	:ensure t)

;;==============================================================================
;; ## Para exibir dicas de atalhos
(use-package which-key
	:ensure t
	:config (which-key-mode))

;;==============================================================================
;; ## Pacote de auto completar
(use-package auto-complete
	:ensure t
	:init
	(progn
		(ac-config-default)
		(global-auto-complete-mode t)))

;;==============================================================================
;; ## all-the-icons
;;(use-package all-the-icons
;;	:ensure t)

;;==============================================================================
;; ## neotree
(use-package neotree
	:ensure t
;;	:config
;;	(progn
;;		(setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
	:bind (("C-\\" . 'neotree-toggle))) ;; Atalho neotree

;;==============================================================================
;; ## ace-window
(use-package ace-window
	:ensure t
	:bind (("C-x o". ace-window)))

;;==============================================================================
;; ## Checagem de sintaxe
(use-package flycheck
	:ensure t
	:init (global-flycheck-mode t))

;;==============================================================================
;; ## Snipptes
(use-package yasnippet
	:ensure t
	:config (yas-global-mode 1))

;;******************************************************************************
;; ## Pacotes - locais
;;******************************************************************************

;;==============================================================================
;; ## Path de pacotes locais
(setq load-path
	(append '("~/.emacs.d/packages/emmet-mode"
						"~/.emacs.d/packages/web-mode"
						"~/.emacs.d/packages/highlight-indent-guides"
						"~/.emacs.d/packages/duplicate-thing"
						"~/.emacs.d/packages/move-text")
	load-path))

;;==============================================================================
;; ## Tema
;;(use-package rebecca-theme
;;	:ensure t
;;	:config (load-theme 'rebecca t))
(load-theme 'manoj-dark)

;;==============================================================================
;; ## Ergoemacs - Atalhos iguais aos outros editores
;; ## http://ergoemacs.github.io/index.html
;;(add-to-list 'load-path "~/.emacs.d/packages/ergoemacs-mode")
;;(require 'ergoemacs-mode)
;;(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
;;(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
;;(ergoemacs-mode 1)

;;==============================================================================
;; ## move-text - https://github.com/emacsfodder/move-text
(require 'move-text)
(move-text-default-bindings)

;;==============================================================================
;; ## highlight-indent-guides - https://github.com/DarthFennec/highlight-indent-guides
(require 'highlight-indent-guides)
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;;==============================================================================
;; ## Emmet - https://github.com/smihica/emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil
(global-set-key (kbd "C-,") 'emmet-expand-line) ;; Expand abbreviation

;;==============================================================================
;; ## web-mode - http://web-mode.org/
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-js-indent-offset 2)

(setq tab-width 2)

(setq web-mode-enable-current-element-highlight nil)
(setq web-mode-enable-current-column-highlight t)

(set-face-attribute 'web-mode-html-tag-face nil :foreground "#F7FC03")

;;==============================================================================
;; ## Duplicate-thing - https://github.com/ongaeshi/duplicate-thing
(require 'duplicate-thing)
(global-set-key (kbd "M-c") 'duplicate-thing)

;;******************************************************************************
;; ## Set - variáveis
;;******************************************************************************

;;==============================================================================
;; melpa stuff
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-default-style "k&r")
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
	 (quote
		("7178dc309d5bb89e9de6feddd71058ddf8cb947bbf08ea6c7799a03ae690449e" default)))
 '(electric-pair-mode 1)
 '(highlight-indent-guides-method (quote character))
 '(indent-tabs-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(js1-indent-on-enter-key t)
 '(make-backup-files nil)
 '(package-selected-packages (quote (move-text try use-package)))
 '(py-python-command "ipython")
 '(python-python-command "ipython")
 '(python-use-skeletons t)
 '(setq-default tab-width t)
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-always-ident t)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
