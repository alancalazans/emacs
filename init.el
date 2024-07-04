;;-------------------------------------------------------
;;--- File: init.el                                   ---
;;--- Author: Alan Calazans <alan2calazans@gmail.com  ---
;;--- Last Update: qui 27 jun 2024 09:53:00 BRT       ---
;;--- Created: dom 20 set 2020 17:38:00 BRT           ---
;;--- License: GNU General Public License v3          ---
;;---          <http://www.gnu.org/licenses/gpl.html> ---
;;--- Version: 1.0                                    ---
;;-------------------------------------------------------
;;---------------------------
;;--- Set - variáveis {{{ ---
;;---------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(c-default-style "k&r")
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   '("7178dc309d5bb89e9de6feddd71058ddf8cb947bbf08ea6c7799a03ae690449e" default))
 '(electric-pair-mode 1)
 '(highlight-indent-guides-method 'character)
 '(indent-tabs-mode t)
 '(indicate-buffer-boundaries 'left)
 '(js2-indent-on-enter-key t)
 '(package-selected-packages
   '(lsp-mode yasnippet nim-mode timu-caribbean-theme timu-macos-theme move-text try use-package))
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
;;--- }}}
;;----------------------------
;;--- Customização pessoal ---
;;----------------------------
;;------------
;;--- Tema ---
;;------------
;;--- Themes Gallery: https://emacsthemes.com/
;;--- TIMU-CARIBBEAN-THEME
;;--- Para instalar:
;;--- `M-x package-install RET timu-caribbean-theme RET`.
(load-theme 'timu-caribbean t)
;;(load-theme 'zenburn t)
;;(load-theme 'timu-macos t)
;;(load-file "~/.emacs.d/masked-theme.el")
;;(load-theme 'masked t)
;;---------------------------
;;--- Remover boas vindas ---
;;---------------------------
(setq inhibit-startup-message t)
;;---------------------
;;--- Remover Menus ---
;;---------------------
(tool-bar-mode -1)
(menu-bar-mode -1)
;;--------------------------------
;;--- Remover barra de rolagem ---
;;--------------------------------
;;(scroll-bar-mode -1)
;;-----------------------
;;--- Rolamento suave ---
;;-----------------------
(setq smooth-scroll-margin 5)
;;--------------------------
;;--- Numeros nas linhas ---
;;--------------------------
;;(global-linum-mode t) ;; Obsoleto desde a versão 29.1 do emacs.
(global-display-line-numbers-mode 1)
;;------------------------
;;--- Tamanho da fonte ---
;;------------------------
;;(set-face-attribute 'default nil :height 110)
(set-face-attribute 'default nil :font "Monospace 12")
;;---------------------------------------------
;;--- Tipo e tamanho da fonte do editor {{{ ---
;;---------------------------------------------
;;(set-default-font "Ubuntu Mono-13")
;;(set-default-font "Monospace-12")
;;(set-default-font "Consolas-11")
;;--- }}}
;;-----------------------------------------------
;;--- Adiciona nova linha ao final do arquivo ---
;;-----------------------------------------------
;;(setq require-final-newline t)
;;----------------------------------------------
;;--- Inicia Emacs com ctrl-{zxcv} abilitado ---
;;--- para desfazer/recortar/copiar/colar    ---
;;----------------------------------------------
(cua-mode t)
;;-----------------------------
;;--- Tamanho da janela {{{ ---
;;-----------------------------
(setq initial-frame-alist
  '(
    (width . 80)
    (height . 35)
  )
)
;;--- }}}
;;---------------------
;;--- Tab ident {{{ ---
;;---------------------
(setq-default electric-indent-inhibit t) ; Inibir o  recuo da linha anterior quando pressiona enter
(setq-default electric-indent-mode nil) ; Desabilita a indentação automática em novas linhas
;;--- space ident
(setq-default ident-tabs-mode nil) ; Desabilita tabulações como caracteres de indentação
(setq tabify nil)
;;--- tab ident
;;(setq-default indent-tabs-mode t)
;;(setq tabify t)
;;(setq c-basic-offset 4)
;;--- }}}
;;-----------------------------
;;--- Definindo paradas de  ---
;;--- tabulação manualmente ---
;;-----------------------------
(setq tab-stop-list '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82))
;;-------------------------------
;;--- Activar a roda do mouse ---
;;-------------------------------
(mwheel-install)
;;---------------------------------
;;--- Tornar todas as perguntas ---
;;--- "yes/no" em y/n           ---
;;---------------------------------
(fset 'yes-or-no-p 'y-or-n-p)
;;--------------------------------------------
;;--- Habilita compartilhamento de área de ---
;;--- transferência com outros aplicativos ---
;;--------------------------------------------
;;(setq x-select-enable-clipboard t)
;;--------------------------------------------
;;--- Desativa o auto salvar e auto backup ---
;;--------------------------------------------
(setq auto-save-default nil) ;; Para o #autosave#.
(setq make-backup-files nil) ;; Para o backup~.
;;--------------------------
;;--- Nossos atalhos {{{ ---
;;--------------------------
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
;;--- }}}
;;-------------------------------------
;;--- Limpando espaços em branco no ---
;;--- final das linhas              ---
;;-------------------------------------
(global-set-key (kbd "C-l") 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;----------------------------------
;;--- Repositório de pacotes {{{ ---
;;----------------------------------
(require 'package)
;;--------------------
;;--- MELPA stable ---
;;--------------------
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;----------------------
;;--- MELPA unstable ---
;;----------------------
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;;--- Observe que você precisará executar `M-x package-refresh-contents` ou `M-x package-list-packages`
;;--- para garantir que o Emacs buscou a lista de pacotes MELPA antes de poder instalar pacotes com
;;--- `M-x package-install` ou similar.
;;--- Para instalar um pacote, execute `M-x package-install <ENTER> <nome_pacote> <ENTER>`.
;;--- Maiores orientações em: `https://melpa.org/#/getting-started`.
;;--- }}}
;;--------------------
;;--- NIM-MODE {{{ ---
;;--------------------
;;--- https://github.com/nim-lang/nim-mode
;; The `nimsuggest-path' will be set to the value of
;; (executable-find "nimsuggest"), automatically.
(setq nimsuggest-path "~/.nimble/bin")

(defun my--init-nim-mode ()
  "Local init function for `nim-mode'."

  ;; Just an example, by default these functions are
  ;; already mapped to "C-c <" and "C-c >".
  (local-set-key (kbd "M->") 'nim-indent-shift-right)
  (local-set-key (kbd "M-<") 'nim-indent-shift-left)

  ;; Make files in the nimble folder read only by default.
  ;; This can prevent to edit them by accident.
  (when (string-match "/\.nimble/" (or (buffer-file-name) "")) (read-only-mode 1))

  ;; If you want to experiment, you can enable the following modes by
  ;; uncommenting their line.
  ;; (nimsuggest-mode 1)
  ;; Remember: Only enable either `flycheck-mode' or `flymake-mode' at the same time.
  ;; (flycheck-mode 1)
  ;; (flymake-mode 1)

  ;; The following modes are disabled for Nim files just for the case
  ;; that they are enabled globally.
  ;; Anything that is based on smie can cause problems.
  (auto-fill-mode 0)
  (electric-indent-local-mode 0)
)

(add-hook 'nim-mode-hook 'my--init-nim-mode)
;;--- }}}
;;---------------------
;;--- YASNIPPET {{{ ---
;;---------------------
;;--- https://github.com/joaotavora/yasnippet
(add-to-list 'load-path
              "~/.emacs.d/elpa/yasnippet-20240406.1314")
(require 'yasnippet)
(yas-global-mode 1)
;;--- }}}
(use-package nim-mode
  :ensure t
  :config
  (add-hook 'nim-mode-hook #'lsp-deferred))
