;;==============================================================================
;; File: .emacs
;; Author: Alan Calazans <alan2calazans@gmail.com>
;; Last Update: ter 12 Mai 2020 15:23:22 BRT
;; Created: ter 01 Jan 2018 20:01:22 BRT
;; Installation: - As dotfile drop the file into your $HOME/ folder.
;; License: GNU General Public License v3
;;          <http://www.gnu.org/licenses/gpl.html>
;; Version: 4.0
;;==============================================================================
(custom-set-variables
	'(blink-cursor-mode nil)
	'(column-number-mode t)
	'(cua-mode t nil (cua-base))
	'(current-language-environment "UTF-8")
	'(indent-tabs-mode t)
	'(setq-default tab-width 2)
	'(c-default-style "k&r") ;; estilo de indentação C
	'(indicate-buffer-boundaries (quote left))
	'(js1-indent-on-enter-key t)
	'(make-backup-files nil)
	'(py-python-command "ipython")
	'(python-python-command "ipython")
	'(python-use-skeletons t)
	'(show-paren-mode t)
	'(standard-indent 2)
	'(tab-always-ident t)
	'(electric-pair-mode 1)
	'(tooltip-mode nil))

(setq load-path
	(append '("~/.emacs.d/themes" "~/.emacs.d/packages/duplicate-thing" "~/.emacs.d/packages/web-mode" "~/.emacs.d/packages/emacs-neotree" "~/.emacs.d/packages/move-text" "~/.emacs.d/packages/quickrun" "~/.emacs.d/packages/emmet-mode" "~/.emacs.d/packages/php-mode" "~/.emacs.d/packages/yasnippet" "~/.emacs.d/packages/go-mode")
	load-path))

;;==============================================================================
;; ## Themes
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'dracula t)
;;(load-theme 'night-owl t)
;;(load-theme 'zerodark t)
(load-theme 'manoj-dark t)

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

;;==============================================================================
;; ## Neotree - https://github.com/jaypei/emacs-neotree
(require 'neotree)
(global-set-key (kbd "C-b") 'neotree-toggle)

;;==============================================================================
;; ## Move-Text - https://github.com/emacsfodder/move-text
(require 'move-text)
(move-text-default-bindings)

;;==============================================================================
;; ## QuickRun - https://github.com/syohex/emacs-quickrun
;;(require 'quickrun)
;; You should assign key binding, if you often use `quickrun' commands.
;; You can override existing command

;; Compile C programs directly from within emacs
(defun compile-c-program ()
  (interactive)
  (defvar foo)
  (setq foo (concat "gcc -Wall " (buffer-name)))
  (shell-command foo))

(global-set-key (kbd "C-.") 'compile-c-program)

;; Run C programs directly from within emacs
(defun run-c-program ()
  (interactive)
  (shell-command "a.exe"))

(global-set-key (kbd "C-;") 'run-c-program)

;;==============================================================================
;; ## Emmet - https://github.com/smihica/emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil
(global-set-key (kbd "C-,") 'emmet-expand-line) ;; Expand abbreviation

;;==============================================================================
;; ## PHP - https://sourceforge.net/projects/php-mode/
(require 'php-mode)

;;==============================================================================
;; ## YASnippet - https://github.com/joaotavora/yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;==============================================================================
;; ## Limpando espaços em branco nos finais das linhas
(global-set-key (kbd "C-l") 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;==============================================================================
;; ## Go-mode - https://github.com/dominikh/go-mode.el
(add-to-list 'load-path "~/.emacs.d/packages/go-mode")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;;==============================================================================
;; ## Tamanho da janela
(setq initial-frame-alist
	'(
		(width . 100)
		(height . 25)
	 )
)

;;==============================================================================
;; ## Troca mensagem do buffer de rascunho
(setq initial-scratch-message
";; Nada neste buffer será salvo. Use:\n
;; Ctrl+x Ctrl+r / Ctrl+x Ctrl+f para ler um arquivo.\n")

;;==============================================================================
;; ## Activar a roda do mouse
(mwheel-install)

;;==============================================================================
;; ## Tornar todas as perguntas "yes/no" em y/n
(fset 'yes-or-no-p 'y-or-n-p)

;;==============================================================================
;; ## Activar o destaque da sintaxe
(global-font-lock-mode t)

;;==============================================================================
;; ## Mostrar a hora na barra de estado
(display-time)
(setq display-time-24hr-format t)

;;==============================================================================
;; ## Define F3 para pesquisar e Shift+F3 para pesquisar próxima
(global-set-key (kbd "C-f") 'isearch-forward)
(define-key isearch-mode-map (kbd "<f3>") 'isearch-repeat-forward)
(define-key isearch-mode-map (kbd "S-<f3>") 'isearch-repeat-backward)

;;==============================================================================
;; ## Abre o emacs sem a janela de boas vindas.
(setq inhibit-startup-screen t)
(add-hook 'emacs-startup-hook 'delete-other-windows)[/code]

;;==============================================================================
;; ## Tab ident
(setq-default indent-tabs-mode t)
(setq-default tab-width 2)
(setq tabify t)
(setq c-basic-offset 2)
(setq-default js2-basic-offset 2)

;;==============================================================================
;; ## Tab em todos modos de edicao
(global-set-key (kbd "TAB") 'self-insert-command);

;;==============================================================================
;; ## Rolamento suave
;;(setq smooth-scroll-margin 5)

;;==============================================================================
;; ## Cor de fundo para a linha do cursor.
;;(global-hl-line-mode 1)

;;==============================================================================
;; ## Modo de linhas de tela (screen lines) e não lógicas (logical lines).
(visual-line-mode 1)

;;==============================================================================
;; ## Numeração das linhas na margem esquerda
(global-linum-mode 1)

;;==============================================================================
;; ## Realçador de pareamento de parenteses, chaves, colchetes, aspas...
(show-paren-mode 1)

;;==============================================================================
;; ## Habilita compartilhamento de área de transferência com outros
;; ## aplicativos.
(setq x-select-enable-clipboard t)

;;==============================================================================
;; ## Desativa o auto salvar e auto backup.
(setq auto-save-default nil) ;; Para o #autosave#.
(setq make-backup-files nil) ;; Para o backup~.

;;==============================================================================
;; ## Tipo e tamanho da fonte do editor.
;;(set-default-font "Ubuntu Mono-13")
(set-default-font "Consolas-11")

;;==============================================================================
;; ## Ativando o Syntax Hilighting
(global-font-lock-mode 1)

;;==============================================================================
;; ## Auxilia na identação do código, colunas coloridas após certa distância
;;(require 'whitespace)
;;(setq whitespace-line-column 300)
;;(setq whitespace-style '(face tabs lines-tail trailing))
;;(global-whitespace-mode t)

;;==============================================================================
;; ## Truncamento de linhas longas
(setq truncate-lines nil)
;;(global-set-key "C-ct" 'toogle-truncate-lines)

;;==============================================================================
;; ## Adiciona nova linha ao final do arquivo
;;(setq require-final-newline t)

;;==============================================================================
;; ## Inicia Emacs com ctrl-{zxcv} abilitado para desfazer/recortar/copiar/colar
(cua-mode t)

;;==============================================================================
;; ## Tamanho da fonte (120~12pt)
;; ## Comandos C-x C-+ e C-x C-- para aumentar e diminiur o tamanho da fonte
(set-face-attribute 'default nil :height 120)

;;==============================================================================
;; ## Configura o autocomplete
(ac-config-default)
(ac-linum-workaround)
