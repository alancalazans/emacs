;;-------------------------------------------------------
;;--- File: init.el                                   ---
;;--- Author: Alan Calazans <alan2calazans@gmail.com> ---
;;--- Last Update: ter 30 jul 2024 07:58:00 BRT       ---
;;--- Created: dom 20 set 2020 17:38:00 BRT           ---
;;--- License: GNU General Public License v3          ---
;;---          <http://www.gnu.org/licenses/gpl.html> ---
;;--- Version: 1.1                                    ---
;;-------------------------------------------------------

;;----------------------------
;;--- Configurações gerais ---
;;----------------------------
(custom-set-variables
 ;; custom-set-variables foi adicionado pelo Custom.
 ;; Edite com cuidado. Seu arquivo init deve conter apenas uma instância.
 '(blink-cursor-mode nil)
 '(c-default-style "k&r")
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(custom-safe-themes
   '("7178dc309d5bb89e9de6feddd71058ddf8cb947bbf08ea6c7799a03ae690449e" default))
 '(electric-pair-mode t)
 '(highlight-indent-guides-method 'character)
 '(indent-tabs-mode nil) ;; Usar espaços ao invés de tabs
 '(indicate-buffer-boundaries 'left)
 '(js2-indent-on-enter-key t)
 '(package-selected-packages
   '(lsp-mode yasnippet nim-mode timu-caribbean-theme timu-macos-theme move-text try use-package))
 '(show-paren-mode t)
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces foi adicionado pelo Custom.
 ;; Edite com cuidado.
 )

;;-----------------------------
;;--- Configurações Visuais ---
;;-----------------------------
;; Tema
(load-theme 'timu-caribbean t)

;; Remover boas vindas
(setq inhibit-startup-message t)

;; Remover menus
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Remover barra de rolagem
(scroll-bar-mode -1)

;; Rolamento suave
(setq scroll-margin 5)

;; Exibir números de linha
(global-display-line-numbers-mode 1)

;; Configurar fonte padrão
(set-face-attribute 'default nil :font "Monospace 12")

;;-------------------------------
;;--- Configurações de Janela ---
;;-------------------------------
(setq initial-frame-alist
      '((width . 80)
        (height . 35)))

;;----------------------------------
;;--- Configurações de Tabulação ---
;;----------------------------------
(setq-default electric-indent-inhibit t) ;; Inibir recuo automático ao pressionar <ENTER>
(setq-default electric-indent-mode nil)  ;; Desabilitar indentação automática
(setq-default indent-tabs-mode nil)      ;; Usar espaços em vez de tabulações
(setq-default tab-width 2)               ;; Largura padrão para tabulações
(setq tabify nil)

;; Definir tabulações manuais
(setq tab-stop-list
      '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82))

;;-------------------------------
;;--- Configuração de atalhos ---
;;-------------------------------
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;; Limpar espaços em branco no final das linhas
(global-set-key (kbd "C-l") 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;-------------------------------
;;--- Repositórios de Pacotes ---
;;-------------------------------
(require 'package)

;; Repositórios
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;;---------------------------
;;--- Configuração do Nim ---
;;---------------------------
;; Caminho para o `nimsuggest` (ajustar conforme necessário)
(setq nimsuggest-path "~/.nimble/bin")

(defun my-init-nim-mode ()
  "Função de inicialização para `nim-mode`."
  (local-set-key (kbd "M->") 'nim-indent-shift-right)
  (local-set-key (kbd "M-<") 'nim-indent-shift-left)
  ;; Tornar arquivos na pasta nimble apenas leitura
  (when (string-match "/\\.nimble/" (or (buffer-file-name) "")) (read-only-mode 1))
  ;; Desabilitar modos problemáticos para arquivos Nim
  (auto-fill-mode 0)
  (electric-indent-local-mode 0)
)

(add-hook 'nim-mode-hook 'my-init-nim-mode)

;; Configuração do LSP para Nim
(use-package nim-mode
  :ensure t
  :config
  (add-hook 'nim-mode-hook #'lsp-deferred))

;;---------------------------------
;;--- Configuração do Yasnippet ---
;;---------------------------------
;; Adicionar caminho do Yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20240406.1314")
(require 'yasnippet)
(yas-global-mode 1)

;;----------------------------
;;--- Outras Configurações ---
;;----------------------------
;; Tornar "yes/no" em "y/n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Desabilitar auto-save e backup
(setq auto-save-default nil) ;; Desabilitar #autosave#
(setq make-backup-files nil) ;; Desabilitar backup~

;; Habilitar CUA mode (atalhos padrão de copiar/colar)
(cua-mode t)

;; Ativar suporte ao mouse
(mwheel-install)
