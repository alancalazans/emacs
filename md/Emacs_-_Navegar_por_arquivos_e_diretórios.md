# Emacs - Navegar por arquivos e diretórios

O Emacs oferece várias opções para explorar e navegar por arquivos e diretórios. Essas ferramentas são essenciais para gerenciar projetos, navegar em pastas e abrir arquivos rapidamente. Aqui estão as principais opções de exploradores de arquivos disponíveis no Emacs:

------

### 1. **`dired` (Directory Editor)**

- **Descrição**: O `dired` é o explorador de arquivos integrado ao Emacs. Ele permite navegar por diretórios, renomear arquivos, excluir, copiar, mover e realizar outras operações de gerenciamento de arquivos diretamente no editor.

- Como usar

  :

  - Abrir um diretório: `C-x d` ou `M-x dired`.
  - Navegar: Use as setas ou `n` (próximo) e `p` (anterior).
  - Abrir arquivos: Pressione `RET` (Enter) no arquivo desejado.
  - Operações: `C` (copiar), `R` (renomear/mover), `D` (excluir), etc.

- **Vantagens**: Integrado ao Emacs, leve e altamente personalizável.

------

### 2. **`neotree`**

- **Descrição**: Um explorador de arquivos em árvore, semelhante ao NERDTree do Vim. Ele exibe a estrutura de diretórios em uma janela lateral.

- **Instalação**: `M-x package-install RET neotree RET`

- Como usar

  :

  - Abrir: `M-x neotree`.
  - Navegar: Use as setas ou `n`/`p`.
  - Abrir arquivos: Pressione `RET`.

- **Vantagens**: Interface visual moderna e fácil de usar.