# Emacs - Guias de indentação

No Emacs, você pode adicionar guias de indentação no editor para melhorar a visualização do código, especialmente em arquivos com muitos blocos aninhados. Isso pode ser feito com o uso de pacotes como o `indent-guide` ou o `highlight-indent-guides`. A seguir, explicarei como configurar ambos.

---

### **1. Usando o pacote `indent-guide`**
O `indent-guide` é um pacote simples que exibe guias verticais para ajudar a visualizar a indentação.

#### **Passos para configurar:**
1. Certifique-se de que o Emacs está configurado para usar o gerenciador de pacotes `MELPA` (se você ainda não configurou, veja [esse link](https://melpa.org/#/getting-started)).
2. Instale o pacote `indent-guide`:
   - Pressione `M-x` e digite `package-install RET indent-guide RET`.
3. Ative o `indent-guide`:
   - Adicione a seguinte configuração ao seu arquivo de configuração do Emacs (`~/.emacs` ou `~/.emacs.d/init.el`):

     ```elisp
     (require 'indent-guide)
     (indent-guide-global-mode)
     ```

4. Salve o arquivo e reinicie o Emacs.
5. Agora as guias de indentação devem aparecer automaticamente nos buffers.

#### **Personalização:**
Você pode personalizar a aparência das guias de indentação. Por exemplo:

```elisp
(setq indent-guide-char "|") ; Define o caractere usado para as guias
(setq indent-guide-delay 0.1) ; Define o atraso para exibir as guias
```

---

### **2. Usando o pacote `highlight-indent-guides`**
O `highlight-indent-guides` é um pacote mais avançado que permite destacar guias de indentação com diferentes estilos, como linhas, colunas ou preenchimento com cores.

#### **Passos para configurar:**
1. Instale o pacote `highlight-indent-guides`:
   - Pressione `M-x` e digite `package-install RET highlight-indent-guides RET`.
2. Adicione a seguinte configuração ao seu arquivo de configuração:

   ```elisp
   (require 'highlight-indent-guides)
   (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

   ;; Escolha o estilo desejado (fill, column, ou character)
   (setq highlight-indent-guides-method 'character)

   ;; Opcional: ajuste as cores automaticamente
   (setq highlight-indent-guides-auto-enabled t)
   (setq highlight-indent-guides-auto-odd-face-perc 15)
   (setq highlight-indent-guides-auto-even-face-perc 20)
   ```

3. Salve o arquivo e reinicie o Emacs.
4. As guias de indentação serão exibidas automaticamente em arquivos de programação.

#### **Estilos disponíveis:**
- `character`: Mostra guias como caracteres (padrão).
- `fill`: Usa preenchimento com cores.
- `column`: Usa colunas coloridas.

Você pode alternar entre os estilos com o comando:

```elisp
M-x highlight-indent-guides-mode
```

---

### **3. Comparação entre os dois pacotes**
- **`indent-guide`**: Simples e leve, ideal para quem só quer linhas básicas de indentação.
- **`highlight-indent-guides`**: Mais configurável e visualmente sofisticado, adequado para quem deseja personalizar a aparência das guias.

Escolha o que melhor se adapta às suas necessidades!

Se precisar de mais ajuda, é só perguntar! 🚀