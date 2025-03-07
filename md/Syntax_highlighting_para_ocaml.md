# Syntax highlighting para ocaml

Para habilitar o **syntax highlighting** para scripts OCaml no Emacs, você pode seguir estes passos:

1. **Instalar o tuareg-mode**:

   Para instalar o `tuareg-mode`, você pode usar os seguintes comandos:

   ```emacs
   M-x package-refresh-contents
   M-x package-install RET tuareg RET
   ```

2. **Configurar o modo para abrir arquivos OCaml**:

   Se você estiver usando o `use-package` (um gerenciador de pacotes popular para Emacs), pode configurar o `tuareg-mode` de forma mais organizada:

   Adicione ao seu arquivo de configuração do Emacs (geralmente `~/.emacs` ou `~/.emacs.d/init.el`) as seguintes linhas para garantir que você está usando o `tuareg-mode` para arquivos com extensão `.ml` ou `.mli`:

   ```lisp
   (use-package tuareg
     :ensure t
     :mode (("\\.ml\\'" . tuareg-mode)
            ("\\.mli\\'" . tuareg-mode)))
   ```

   > **Obs.:** Isso garante que o `tuareg-mode` seja instalado e configurado automaticamente.
   >
   > **Obs2.:** A mensagem **`Package cl is deprecated`** aparece porque o pacote `cl` (Common Lisp) foi substituído pelo `cl-lib` em versões mais recentes do Emacs. Alguns pacotes mais antigos (ou configurações) ainda usam `(require 'cl)`, o que gera esse aviso. Para resolver o problema, siga os passos abaixo:
   >
   > Adicione ao seu arquivo de configuração do Emacs (`~/.emacs` ou `~/.emacs.d/init.el`) a seguinte linha para desabilitar o aviso específico relacionado ao `cl`:
   >
   > ```lisp
   > ;; Desabilitar aviso de depreciação do pacote 'cl'
   > (setq byte-compile-warnings '(cl-functions))
   > ```
   >
   > ### **Nota adicional**
   >
   > O `tuareg-mode` geralmente funciona normalmente mesmo com o `cl` depreciado.

   **Trecho completo para inclusão no arquivo (`~/.emacs.d/init.el`)**

   ```lisp
   ;;---
   ;; Tuareg - OCaml syntax highligth {{{
   ;;---
   (use-package tuareg
     :ensure t
     :mode (("\\.ml\\'" . tuareg-mode)
            ("\\.mli\\'" . tuareg-mode)))
   ;; Desabilitar aviso de depreciação do pacote 'cl'
   (setq byte-compile-warnings '(cl-functions))
   ;;--- }}} Fim - Tuareg - OCaml syntax highligth
   ```

3. **Recarregar o Emacs**: Após fazer as alterações, salve seu arquivo de configuração e recarregue o Emacs. Agora, ao abrir arquivos OCaml, a syntax highlighting deverá ser ativado automaticamente! 🎉
