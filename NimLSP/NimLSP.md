# NimLSP

Para ativar o `flymake-mode` para Nim no Emacs, você precisa seguir estes passos:

**1. Instalar o compilador Nim e o `nimlsp`:**

- **Compilador Nim:** Certifique-se de ter o compilador Nim instalado e no seu PATH. Você pode baixá-lo em https://nim-lang.org/.
- **`nimlsp`:** Instale o `nimlsp`, o Language Server Protocol (LSP) para Nim. Você pode instalá-lo usando o gerenciador de pacotes `nimble`:

```sh
$ nimble install nimlsp
```

**2. Configurar o `lsp-mode`:**

- **Instalar:** Se você ainda não o fez, instale o pacote `lsp-mode` do MELPA.
- **Ativar:** Adicione o seguinte ao seu arquivo de configuração do Emacs (`init.el` ou `.emacs`):

```lisp
(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-buffer-diagnostics))
```

**3. Configurar o `nim-mode`:**

- **Instalar:** Se você ainda não o fez, instale o pacote `nim-mode` do MELPA.
- **Ativar `lsp-mode`:** Adicione o seguinte ao seu arquivo de configuração do Emacs para ativar o `lsp-mode` para arquivos Nim:

```lisp
(use-package nim-mode
  :ensure t
  :config
  (add-hook 'nim-mode-hook #'lsp-deferred))
```

**4. Reiniciar o Emacs:**

- Reinicie o Emacs ou avalie o código acima no seu arquivo de configuração.

**5. Verificar a configuração:**

- Abra um arquivo `.nim`. O `flymake-mode` deve ser ativado automaticamente e você deve ver os erros e avisos destacados no buffer.

**Informações adicionais:**

- Você pode personalizar o comportamento do `flymake-mode` e do `lsp-mode` usando as variáveis de personalização disponíveis. Consulte a documentação dos pacotes para obter mais informações.
- Se você encontrar problemas, verifique se o `nimlsp` está em execução corretamente e se o caminho para ele está definido corretamente no Emacs.

Espero que isso ajude!