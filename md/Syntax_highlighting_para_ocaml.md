# Syntax highlighting para ocaml

Para habilitar o **syntax highlighting** para scripts OCaml no Emacs, você pode seguir estes passos:

1. **Instalar o tuareg-mode**:

   Para instalar o `tuareg-mode`, você pode usar os seguintes comandos:

   ```emacs
   M-x package-refresh-contents
   M-x package-install RET tuareg RET
   ```

2. **Configurar o modo para abrir arquivos OCaml**: Adicione ao seu arquivo de configuração do Emacs (geralmente `~/.emacs` ou `~/.emacs.d/init.el`) as seguintes linhas para garantir que você está usando o `tuareg-mode` para arquivos com extensão `.ml` ou `.mli`:

   ```lisp
   (require 'tuareg)
   (add-to-list 'auto-mode-alist '("\\.ml[ily]?$" . tuareg-mode))
   (add-to-list 'auto-mode-alist '("\\.top$" . tuareg-mode))
   ```

   **ou**

   ```lisp
   (use-package tuareg
     :mode (("\\.ml[ily]?$" . tuareg-mode)
            ("\\.top$" . tuareg-mode))
     :ensure t)
   ```

   **Trecho completo**

   ```lisp
   ;;---
   ;; Tuareg - Highlighting OCaml {{{
   ;;---
   ;;(require 'tuareg)
   ;;(add-to-list 'auto-mode-alist '("\\.ml[ily]?$" . tuareg-mode))
   ;;(add-to-list 'auto-mode-alist '("\\.top$" . tuareg-mode))
   (use-package tuareg
     :mode (("\\.ml[ily]?$" . tuareg-mode)
            ("\\.top$" . tuareg-mode))
     :ensure t)
   ;;--- }}} Fim - Tuareg - Highlighting OCaml
   ```

3. **Recarregar o Emacs**: Após fazer as alterações, salve seu arquivo de configuração e recarregue o Emacs. Agora, ao abrir arquivos OCaml, a syntax highlighting deverá ser ativado automaticamente! 🎉

------

**Instalar o ocaml-mode (para versão do emacs a partir da versão 29.1)**:

**Descrição**: O modo oficial para edição de código OCaml no Emacs. Ele fornece syntax highlighting básico, indentação e suporte para compilação.

1. **Instalar o ocaml-mode**:

   ```emacs
   M-x package-refresh-contents
   M-x package-install RET ocaml-mode RET
   ```

2. **Configurar o modo para abrir arquivos OCaml**: Adicione ao seu arquivo de configuração do Emacs (geralmente `~/.emacs` ou `~/.emacs.d/init.el`) as seguintes linhas para garantir que você está usando o `ocaml-mode` para arquivos com extensão `.ml` ou `.mli`:

   ```lisp
   ;; Carrega o ocaml-mode automaticamente para arquivos .ml e .mli
   (autoload 'ocaml-mode "ocaml-mode" "Major mode for editing OCaml code." t)
   (add-to-list 'auto-mode-alist '("\\.ml\\'" . ocaml-mode))
   (add-to-list 'auto-mode-alist '("\\.mli\\'" . ocaml-mode))
   ;; Opcional: Configurações adicionais para ocaml-mode
   (setq ocaml-indent-offset 2)  ;; Define o tamanho da indentação
   ```