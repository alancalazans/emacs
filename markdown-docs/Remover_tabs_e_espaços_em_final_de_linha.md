# Emacs - Remover tabs e espaços em final de linha

Para exibir caracteres de espaços no final das linhas (trailing whitespace) no Emacs, você pode adicionar as seguintes configurações ao seu arquivo `init.el`:

------

### 1. **Habilitar a exibição de espaços no final da linha**

Use a variável `show-trailing-whitespace` para destacar automaticamente esses espaços:

```lisp
(setq-default show-trailing-whitespace t)
```

Isso marcará os espaços em branco no final das linhas com um símbolo ou cor específica.

------

### 2. **Personalizar a aparência dos espaços**

Para definir uma cor ou estilo visual mais claro, configure o `face` associado ao `trailing-whitespace`:

```lisp
(set-face-attribute 'trailing-whitespace nil
                    :background "red"   ; Cor de fundo
                    :foreground "white" ; Cor do texto
                    :weight 'bold)      ; Estilo em negrito
```

Isso tornará os espaços finais mais visíveis.

------

### 3. **Usar `whitespace-mode` para mais controle**

O pacote `whitespace` permite exibir não apenas espaços finais, mas também outros tipos de espaçamento indesejados (como tabs ou linhas em branco):

```lisp
(require 'whitespace)
(setq whitespace-style '(face trailing tabs empty lines-tail))
(global-whitespace-mode 1)
```

- `trailing`: Destaca espaços no final da linha.
- `tabs`: Mostra tabs como símbolos.
- `lines-tail`: Marca linhas que excedem um comprimento máximo (útil para padrões de código) 12.

------

### 4. **Remover espaços automaticamente ao salvar**

Se desejar remover esses espaços automaticamente ao salvar o arquivo, adicione:

```lisp
(add-hook 'before-save-hook 'delete-trailing-whitespace)
```

Isso limpará os espaços finais em todos os arquivos antes de salvá-los 8.

------

### 5. **Verificação de erros na configuração**

Se as configurações não surtirem efeito:

- Use `M-x load-file RET ~/.emacs.d/init.el` para recarregar o arquivo manualmente.
- Inicie o Emacs com `emacs --debug-init` para identificar erros de sintaxe no `init.el` 10.
- Verifique se não há conflitos com outros arquivos de configuração (como `.emacs`) 9.

------

### Exemplo completo no `init.el`:

```lisp
;; Exibir espaços no final das linhas
(setq-default show-trailing-whitespace t)
(set-face-attribute 'trailing-whitespace nil :background "red")

;; Configuração avançada com whitespace-mode
(require 'whitespace)
(setq whitespace-style '(face trailing tabs lines-tail))
(global-whitespace-mode 1)

;; Remover espaços automaticamente ao salvar
(add-hook 'before-save-hook 'delete-trailing-whitespace)
```

Para mais detalhes sobre personalização de temas ou integração com plugins como `rainbow-delimiters`, consulte 12.