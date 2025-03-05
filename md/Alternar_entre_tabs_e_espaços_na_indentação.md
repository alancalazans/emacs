# Emacs - Alternar entre tabs e espaços na indentação

### **Passo 1: Configurar o Emacs para usar Tabs**

Certifique-se de que o Emacs está configurado para usar tabs ao invés de espaços. Adicione ao seu arquivo de configuração (`~/.emacs` ou `~/.emacs.d/init.el`):

```lisp
(setq-default indent-tabs-mode t) ; Usa tabs para indentação
(setq-default tab-width 4)        ; Define o tamanho do tab (ex: 4 espaços)
```

Ou execute temporariamente no buffer atual com:

```lisp
M-x set-variable RET indent-tabs-mode RET t
M-x set-variable RET tab-width RET 4
```

------

### **Passo 2: Converter Espaços para Tabs**

Use o comando **`tabify`** para substituir sequências de espaços por tabs, respeitando o `tab-width` definido.

1. **Selecione a região** que deseja converter (ou deixe sem seleção para todo o buffer).

2. Execute:

   ```lisp
   M-x tabify
   ```

   Isso substituirá grupos de espaços por tabs onde possível.

------

### **Exemplo Prático**

- **Antes** (indentação com espaços):

  ```
    linha 1
        linha 2
  ```

- **Depois** (com `tab-width=4`):

  ```
    linha 1
    	linha 2
  ```

------

### **Observações**

- O comando inverso (**`untabify`**) converte tabs para espaços.
- Verifique se os espaços estão alinhados com o `tab-width` para evitar inconsistências.
- Alguns modos (ex: `python-mode`) podem sobrescrever configurações. Configure-os individualmente se necessário.

Para mais detalhes, consulte a documentação oficial com `C-h f tabify`.