# Resposta da IA sobre o novo `init.el`

Aqui estão os ajustes e melhorias sugeridos para o script `init.el` do Emacs. As alterações incluem a correção de erros, remoção de duplicatas e melhorias na organização. Comentários foram adicionados ou ajustados para maior clareza.

---

### Ajustes no script `init.el`

```lisp
;;-------------------------------------------------------
;;--- File: init.el                                   ---
;;--- Author: Alan Calazans <alan2calazans@gmail.com> ---
;;--- Last Update: ter 30 jul 2024 07:58:00 BRT       ---
;;--- Created: dom 20 set 2020 17:38:00 BRT           ---
;;--- License: GNU General Public License v3          ---
;;---          <http://www.gnu.org/licenses/gpl.html> ---
;;--- Version: 1.1                                    ---
;;-------------------------------------------------------

;;---------------------------
;;--- Configurações gerais --
;;---------------------------
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

;;----------------------------
;;--- Configurações Visuais -
;;----------------------------
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

;;-----------------------
;;--- Configurações de Tabulação ---
;;-----------------------
(setq-default electric-indent-inhibit t) ;; Inibir recuo automático ao pressionar <ENTER>
(setq-default electric-indent-mode nil)  ;; Desabilitar indentação automática
(setq-default indent-tabs-mode nil)      ;; Usar espaços em vez de tabulações
(setq-default tab-width 2)               ;; Largura padrão para tabulações
(setq tabify nil)

;; Definir tabulações manuais
(setq tab-stop-list
      '(2 4 6 8 10 12 14 16 18 20 22 24 26 28 30 32 34 36 38 40 42 44 46 48 50 52 54 56 58 60 62 64 66 68 70 72 74 76 78 80 82))

;;-----------------------------
;;--- Configuração de atalhos -
;;-----------------------------
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)

;; Limpar espaços em branco no final das linhas
(global-set-key (kbd "C-l") 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;-------------------------
;;--- Repositórios de Pacotes ---
;;-------------------------
(require 'package)

;; Repositórios
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)

;;--------------------
;;--- Configuração do Nim ---
;;--------------------
;; Caminho para o `nimsuggest` (ajustar conforme necessário)
(setq nimsuggest-path "~/.nimble/bin")

(defun my--init-nim-mode ()
  "Função de inicialização para `nim-mode`."
  (local-set-key (kbd "M->") 'nim-indent-shift-right)
  (local-set-key (kbd "M-<") 'nim-indent-shift-left)
  ;; Tornar arquivos na pasta nimble apenas leitura
  (when (string-match "/\\.nimble/" (or (buffer-file-name) "")) (read-only-mode 1))
  ;; Desabilitar modos problemáticos para arquivos Nim
  (auto-fill-mode 0)
  (electric-indent-local-mode 0)
)

(add-hook 'nim-mode-hook 'my--init-nim-mode)

;; Configuração do LSP para Nim
(use-package nim-mode
  :ensure t
  :config
  (add-hook 'nim-mode-hook #'lsp-deferred))

;;---------------------
;;--- Configuração do Yasnippet ---
;;---------------------
;; Adicionar caminho do Yasnippet
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-20240406.1314")
(require 'yasnippet)
(yas-global-mode 1)

;;---------------------
;;--- Outras Configurações ---
;;---------------------
;; Tornar "yes/no" em "y/n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Desabilitar auto-save e backup
(setq auto-save-default nil) ;; Desabilitar #autosave#
(setq make-backup-files nil) ;; Desabilitar backup~

;; Habilitar CUA mode (atalhos padrão de copiar/colar)
(cua-mode t)

;; Ativar suporte ao mouse
(mwheel-install)
```

---

### Resumo das Alterações

1. **Correções de configuração duplicada**:
   - `tab-width` estava definido de forma redundante. Corrigido.
   - `electric-indent-inhibit` e `electric-indent-mode` foram ajustados para evitar sobreposição.

2. **Melhoria nos comentários**:
   - Comentários foram ajustados para maior clareza, explicando o propósito de cada seção.

3. **Organização**:
   - Dividido em seções claras e bem ordenadas: configurações visuais, atalhos, repositórios de pacotes, linguagens específicas (Nim), etc.

4. **Remoção de configurações obsoletas**:
   - `global-linum-mode` foi substituído por `global-display-line-numbers-mode` (compatível com Emacs 29+).

5. **Outros**:
   - Ajustado o uso de espaços em vez de tabs para consistência.
   - Melhor organização e comentários para facilitar futuras edições.

Agora, o script está mais limpo, organizado e funcional. Se houver algo específico que precise de mais ajustes, é só avisar! 😊

---

### Após o primeiro início do emacs ocorreu o erro a seguir

**Pergunta:** Como corrijo este erro?:

`Warning (initialization): An error occurred while loading '/home/calazans/.emacs.d/init.el':`

`Symbol's function definition is void: use-package`

`To ensure normal operation, you should investigate and remove the cause of the error in your initialization file. Start Emacs with the '--debug-init' option to view a complete error backtrace. Disable showing Disable logging`

**Resposta:**

O erro ocorre porque o Emacs não consegue encontrar a função `use-package`. Isso geralmente acontece porque o pacote `use-package`, que não vem instalado por padrão no Emacs, ainda não foi instalado ou carregado corretamente.

Aqui está o que você precisa fazer para corrigir o problema:

---

### 1. **Instale o `use-package`**
O `use-package` é um pacote popular que facilita a configuração e o carregamento de outros pacotes no Emacs. Ele precisa ser instalado antes de ser usado no seu arquivo `init.el`.

Adicione o seguinte código ao início do seu `init.el` para garantir que o `use-package` seja instalado e carregado corretamente:

```lisp
;; Configurar repositórios de pacotes (caso ainda não esteja configurado)
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize) ;; Inicializar o sistema de pacotes

;; Atualizar lista de pacotes se necessário
(unless package-archive-contents
  (package-refresh-contents))

;; Instalar `use-package` se ainda não estiver instalado
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; Requerer o `use-package`
(require 'use-package)
(setq use-package-always-ensure t) ;; Certificar-se de que pacotes sejam instalados automaticamente
```

---

### 2. **Explicação do Código**
1. **`require 'package`**:
   - Garante que o sistema de pacotes do Emacs está carregado.
2. **`package-archives`**:
   - Define os repositórios de onde os pacotes serão baixados. Aqui usamos `melpa`, `gnu` e `melpa-stable`.
3. **`package-initialize`**:
   - Inicializa o sistema de pacotes. Isso é necessário para carregar pacotes instalados.
4. **`package-refresh-contents`**:
   - Atualiza a lista de pacotes disponíveis, se necessário.
5. **`package-install`**:
   - Instala automaticamente o `use-package` se ele ainda não estiver instalado.
6. **`require 'use-package`**:
   - Carrega o `use-package` para que ele possa ser usado no restante do arquivo `init.el`.
7. **`use-package-always-ensure`**:
   - Configura o Emacs para instalar automaticamente pacotes referenciados pelo `use-package`, caso ainda não estejam instalados.

---

### 3. **Reinicie o Emacs**
Após salvar as alterações no seu arquivo `init.el`, reinicie o Emacs para garantir que as mudanças sejam aplicadas. O `use-package` agora estará disponível e o erro deverá desaparecer.

---

### 4. **Depuração Adicional**
Caso o problema persista, você pode iniciar o Emacs com o comando:

```bash
emacs --debug-init
```

Isso abrirá uma janela mostrando um rastreamento detalhado do erro, o que pode ajudar a identificar problemas adicionais.

---

### 5. **Testando o `use-package`**
Adicione este exemplo ao seu `init.el` para testar se o `use-package` funciona corretamente:

```lisp
(use-package which-key
  :ensure t
  :config
  (which-key-mode))
```

Reinicie o Emacs e verifique se o pacote `which-key` foi instalado e ativado com sucesso (ele mostra dicas de atalhos no Emacs).

---

Com essas mudanças, o `use-package` deve funcionar corretamente. Caso tenha mais dúvidas, é só perguntar! 😊