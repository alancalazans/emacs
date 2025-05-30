;;---
;; File: init.el
;; Author: Alan Calazans <alan2calazans@gmail.com>
;; Last Update: qua 05 fev 2025 10:22:00 BRT
;; Created: dom 20 set 2020 17:38:00 BRT
;; License: GNU General Public License v3
;;        <http://www.gnu.org/licenses/gpl.html>
;; Version: 2.0
;;---
;;---
;; Configurações básicas {{{
;;---
(setq debug-on-error t)
(setq-default coding-system-for-read 'utf-8)
(setq-default coding-system-for-write 'utf-8)
;;--- }}} Fim - Configurações básicas
;;---
;; Configurações gerais {{{
;;---
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
 '(electric-pair-mode t)
 '(highlight-indent-guides-method 'character)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries 'left)
 '(js2-indent-on-enter-key t)
 '(package-selected-packages
   '(rust-mode neotree move-text indent-guide yasnippet dracula-theme))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;--- }}} Fim - Configurações gerais
;;---
;; Configurações Visuais {{{
;;---
;; Remover boas vindas
(setq inhibit-startup-message t)
;; Remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)
;; Remover barra de rolagem
(scroll-bar-mode -1)
;; Rolamento suave
(setq scroll-margin 1)
;;(setq scroll-step 1) ;; Rolar uma linha de cada vez
;; Exibir números de linha
(global-display-line-numbers-mode 1)
;; Configurar a fonte de acordo com o sistema operacional
(cond
  ((eq system-type 'windows-nt) ;; Verifica se o sistema é Windows
   (set-face-attribute 'default nil :font "Consolas 12"))
  ((eq system-type 'gnu/linux) ;; Verifica se o sistema é GNU/Linux
   (set-face-attribute 'default nil :font "Monospace 12"))
  ((eq system-type 'darwin) ;; Verifica se o sistema é macOS (opcional)
   (set-face-attribute 'default nil :font "Monaco 12"))
  (t ;; Caso padrão para outros sistemas operacionais
   (set-face-attribute 'default nil :font "Monospace 12")))
;;--- }}} Fim - Configurações Visuais
;;---
;; Configurações de janela {{{
;;---
(setq initial-frame-alist
      '(
        (width . 90)
        (height . 35)
        )
      )
;;--- }}} Fim - Configurações de janela
;;---
;; Configurações de tabulação {{{
;;---
(setq-default electric-indent-inhibit t) ;; Inibir recuo automático ao pressionar <ENTER>
(setq-default electric-indent-mode t) ;; Para desabilitar indentação automática `nil`
(setq-default indent-tabs-mode nil) ;; Usar espaços em vez de tabulações
(setq-default tab-width 2) ;; Largura padrão para tabulações
(setq tabify nil)
;; Definir tabulações manuais
(setq tab-stop-list
      '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82)
      )
;;--- }}} Fim - Configurações de tabulação
;;---
;; Configuração de atalhos {{{
;;---
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
;; Deslocar indentação
(global-set-key (kbd "C-i") 'indent-rigidly)
;; Limpar espaços em branco no final das linhas
(global-set-key (kbd "C-l") 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;;--- }}} Fim - Configurações de atalhos
;;---
;; Configurar repositórios de pacotes {{{
;;---
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)
;; Atualizar lista de pacotes se necessário
(unless package-archive-contents
  (package-refresh-contents))
;; Instalar `use-package` se ainda não estiver instalado
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ;; Certificar-se de que pacotes sejam instalados automaticamente
;;--- }}} Fim - Configurar repositórios de pacotes
;;---
;; Pacotes {{{
;;---
;; Dracula-theme {{{
;;---
;;(use-package dracula-theme
;;  :config
;;  (load-theme 'dracula t))
;;--- }}} Fim - Dracula-theme
;;---
;; Molokai-theme {{{
;;---
(use-package molokai-theme
  :config
  (load-theme 'molokai t))
;;--- }}} Fim - Molokai-theme
;;---
;; Neotree {{{
;;---
(use-package neotree
  :config
  (global-set-key [f8] 'neotree-toggle))
;;--- }}} Fim - Neotree
;;---
;; Yasnippet {{{
;;---
(use-package yasnippet
  :config
  (yas-global-mode 1))
;;--- }}} Fim - Yasnippet
;;---
;; Indent-guide {{{
;;---
(use-package indent-guide
  :config
  (indent-guide-global-mode))
;;--- }}} Fim - Indent-guide
;;---
;; Rust-mode {{{
;;---
(use-package rust-mode
  :config
  (rust-mode))
;;--- }}} Fim - Rust-mode
;;---
;; Duplicate-thing {{{
;;---
(use-package duplicate-thing
  :config
  (global-set-key (kbd "M-c") 'duplicate-thing))
;;--- }}} Fim - Duplicate-thing
;;---
;; Move-text {{{
;;---
(use-package move-text
  :bind (("C-M-<up>" . move-text-up)
         ("C-M-<down>" . move-text-down)))
;;--- }}} Fim - Move-text
;;--- }}} Fim - Pacotes
;;---
;; Outras Configurações {{{
;;---
;; Exibir espaços e tabs no final das linhas
;;(set-face-attribute 'trailing-whitespace nil
;;                    :background "red"   ; Cor de fundo
;;                    :foreground "white" ; Cor do texto
;;                    :weight 'bold)      ; Estilo em negrito
(setq-default show-trailing-whitespace t)
;; Remover espaços e tabs no final das linhas ao salvar o arquivo
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Tornar "yes/no" em "y/n"
(fset 'yes-or-no-p 'y-or-n-p)
;; Desabilitar auto-save e backup
(setq auto-save-default nil) ;; Desabilitar #autosave#
(setq make-backup-files nil) ;; Desabilitar backup~
;; Habilitar CUA mode (atalhos padrão de copiar/colar)
(cua-mode t)
;; Atalhos úteis
(winner-mode t);; Ctrl + arrows para navegar entre janelas
(setq visible-bell t) ;; Substitui o som do sino por um piscar de tela
;; Ativar suporte ao mouse
(mwheel-install)
;;--- }}} Fim - Outras Configurações
