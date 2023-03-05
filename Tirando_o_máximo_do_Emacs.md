**Tirando o máximo do Emacs**

[fonte](https://augustocampos.net/revista-do-linux/033/tutorial.html)

Conheça alguns pequenos ajustes que irão aumentar sua produtividade

Tanto o GNU Emacs quanto o XEmacs são editores de texto poderosos e muito conhecidos pelos desenvolvedores UNIX, que também podem ser usados sob o MS-DOS, Windows e Mac OS. Neste artigo, descrevo alguns pequenos ajustes de configuração para tornar o uso destes editores mais confortável.

**Introdução**

Até recentemente, usuários UNIX tinham duas escolhas para um editor: vi e Emacs. Embora o vi fosse (e ainda seja) muito popular, usuários veteranos preferem o Emacs por sua extensibilidade. O Emacs foi desenvolvido de forma que novas funções pudessem ser adicionadas facilmente. Para este propósito, o Emacs tem a sua própria linguagem de programação: Emacs lisp. Devido a esta capacidade de expansão, o Emacs pode realizar as mais diferentes tarefas: de jogar partidas de Tetris a atuar como um cliente de e-mail.

A popularidade do Emacs não é maior porque ele geralmente necessita de alguns ajustes em sua configuração antes de se tornar realmente usável. A maioria dos distribuidores costuma não pré-configurar o Emacs, tornando-o um pouco complicado para a maioria dos novos usuários. Contudo, com muito pouco esforço você pode fazer o Emacs ter um excelente desempenho.

Antes de continuarmos, você precisa saber de algo: Há não muito tempo atrás, alguns desenvolvedores do GNU Emacs se desentenderam com a Free Software Foundation sobre várias questões técnicas/filosóficas. Esta situação causou um “fork”: o XEmacs. GNU Emacs e XEmacs são, em sua maior parte, compatíveis, mas há algumas diferenças pequenas quanto ao Emacs lisp. A não ser onde expressamente indicado, tudo neste artigo serve tanto para o XEmacs quanto para o Emacs. O autor usará o termo “Emacs” para se referir tanto ao Emacs quanto ao XEmacs.

Uma das diferenças entre o XEmacs e o GNU Emacs é o sistema de configuração. Ambos usam arquivos de configuração diferentes, então é melhor esclarecer as diferenças de uma vez. O GNU Emacs usa um arquivo de configuração chamado .emacs, localizado no diretório /home do usuário. Por sua vez, o XEmacs usa dois arquivos de configuração guardados em $HOME/.xemacs: init.el e custom.el. Os três arquivos contêm código Emacs lisp que é executado na inicialização do Emacs. No caso do GNU Emacs, todo o código de configuração está em um único arquivo, mas o XEmacs tenta organizar as coisas separando o código de inicialização do de customização. Você pode pensar em init.el como sendo o mesmo que .emacs, e o arquivo que você provavelmente irá editar. O outro arquivo é utilizado pelo sistema de customização interna do XEmacs e será discutido mais adiante.

Para testar a configuração do Emacs, edite seu arquivo de configuração (.emacs ou init.el, dependendo de qual editor você usa. De agora em diante, todos os exemplos estarão focados no XEmacs) e adicione a seguinte linha:

(display-time)

• A função display-time fará o Emacs mostrar a hora atual em sua barra de status, como na figura abaixo. Esta é uma boa maneira de saber se o Emacs está lendo o arquivo de configuração correto.

**Customização do Emacs**

Para a alegria dos usuários iniciantes, o Emacs pode ser completamente c ustomizado, sem a necessidade de editar os arquivos de configuração. Isto é feito pelo sistema interno de customização do Emacs, facilmente acessível através do menu Options->Advanced no XEmacs ou Options->Customize Emacs no GNU Emacs.

Você também pode digitar o seguinte comando para entrar no sistema de customização em qualquer dos “sabores” do Emacs:

M-x customize RET

Freqüentemente, os usuários do Emacs usam uma nomenclatura estranha quando se referem a combinações de teclas em seu editor. O Emacs considera quatro teclas “modificadoras”: Control, Alt, Meta e Shift. Estas teclas são freqüentemente marcadas como C, A, M e S, respectivamente.

A tecla Meta poderá criar confusão entre os novos usuários, mas se você usa um PC, a Meta será provavelmente as teclas ESC e Alt (para o Emacs não há diferença). Em alguns teclados, a Meta pode ser a tecla “Windows”.

Então, o comando acima significa que você deve pressionar a tecla Meta em conjunto com a tecla x, seguida do texto “customize” e Return, ou Enter. Isto irá abrirá a tela de customização. Embora ela seja intimidante à primeira vista, é, na verdade um sistema de configuração muito simples e eficiente, no qual você irá navegará através de um conjunto de botões:

O sistema de customização é, na verdade, um arquivo aberto pelo Emacs contendo um conjunto de “widgets” que você pode usar para ajustar suas preferências. Você pode experimentar mudando qualquer opção que achar interessante e clicando em Set. As configurações serão aplicadas à sessão atual do Emacs, mas perdidas quando você reiniciar o programa. Quando estiver satisfeito com os ajustes, clique em Save, que gravará sua configuração em um arquivo (.emacs ou custom.el, dependendo da sua versão do Emacs).

**Selecionando texto**

Uma das primeiras coisas que os novos usuários percebem no Emacs é o seu estranho método de seleção. A maioria dos usuários está muito mais acostumada a selecionar blocos de texto com o mouse, em um ambiente gráfico, ou com as setas do teclado em modo texto.

Por padrão, a seleção de texto no Emacs envolve marcar o início de um bloco (pressionando C-Espaço) e então indo ao fim do bloco. Não há nenhuma “dica” visível. Felizmente, isto pode ser facilmente mudado.

Você pode usar C-w para cortar o texto selecionado, M-w para copiá-lo e M-y para colá-lo.

**Seleções visíveis**

O modo de seleção padrão do Emacs não seria tão estranho se não fosse pela completa falta de dicas visuais sobre o que está sendo selecionado. Felizmente, isto é facilmente corrigível simplesmente colocando a linha abaixo em seu arquivo de configuração:

(setq transient-mark-mode t)

Salve a configuração e reinicie o Emacs. Agora você deve ser capaz de ver o que está sendo selecionado.

“Seleção PC”

Infelizmente, esta é uma das coisas que mudam entre o GNU Emacs e o XEmacs. Cada um faz “seleção PC” de forma diferente. Para habilitar este modo no XEmacs, coloque as seguintes linhas em seu arquivo init.el.

;; seleção de texto como no PC
(load “pc-select”)
(pc-select-mode)

E para o GNU Emacs, adicione estas linhas ao seu .emacs.

;; seleção de texto como no PC
(require 'pc-select)
(pc-selection-mode)

Após adicionar as linhas apropriadas em seu arquivo de configuração e reiniciar o Emacs, você deve ser capaz de selecionar texto simplesmente mantendo a tecla Shift pressionada e usando as setas do teclado para indicar o que deve ser selecionado.

Sobrescrevendo seleções automaticamente

Juntamente com a seleção PC, é provável que você queira que o trecho selecionado seja sobrescrito pelo que você digitar, já que este é o comportamento padrão na maioria dos editores. Fazer isto requer a adição das seguintes linhas no arquivo de configuração do GNU Emacs:

(require 'delsel)
(delete-selection-mode 1)

E para o XEmacs, adicione estas linhas:

(require 'pending-del)
(pending-delete-mode 1)

Salve e reinicie. De agora em diante, quando você digitar algo e houver um bloco selecionado, a seleção será sobrescrita.

**O começo e o fim**

Outro comportamento irritante do Emacs é o uso estranho das teclas Home e End. Na maioria dos editores no UNIX, Mac OS ou Microsoft Windows estas teclas são usadas para ir ao começo e ao fim da linha, respectivamente. No Emacs, elas o levam ao começo e ao fim do documento. Isto é particularmente irritante para programadores veteranos acostumados a usar estas teclas para acelerar o processo de edição de um arquivo.

Para fazer o Emacs se comportar mais normalmente, você pode colocar as seguintes linhas em seu arquivo de configuração:

;; End vai para o fim da linha
(define-key global-map [end] 'end-of-line)
;; Home vai para o começo da linha
(define-key global-map [home] 'beginning-of-line)
;; Control-End vai para o fim do documento
(define-key global-map [C-end] 'end-of-buffer)
;; Control-Home vai para o começo do documento
(define-key global-map [C-home] 'beginning-of-buffer)

Salve o arquivo de configuração e reinicie o editor. De agora em diante, as teclas Home e End se comportarão da maneira comum.

**Backspace e Delete**

Definitivamente, o aspecto mais irritante de uma instalação padrão do Emacs é o comportamento de teclas importantes como Backspace e Delete. Contudo, isto não é constante em todas as plataformas em que o Emacs roda.

Você pode se surpreender ao saber que a Backspace não faz o esperado (apagar o caractere anterior). Em vez disto, ela apaga o caractere à frente. Em algumas plataformas, a tecla Delete também está errada, então, se você experimentar comportamento estranho com estas teclas, simplesmente adicione estas duas linhas ao seu arquivo de configuração:

(define-key global-map [backspace] 'delete-backward-char)
(define-key global-map [delete] 'delete-char)

Agora tudo deve se comportar conforme o esperado.

Embora extremamente poderoso, o Emacs não é um editor fácil de usar logo de início. Contudo, após um pequeno esforço, o Emacs pode ser usado para aumentar sua produtividade. O autor sabe que este documento está incompleto, mas as poucas dicas aqui descritas podem ajudar os usuários a iniciar no uso do Emacs rapidamente.

**Trivia**

O nome Emacs originalmente era um acrônimo para Editor MACroS. O primeiro Emacs foi um conjunto de Macros escritas por Richard Stallman no MIT em 1976 para o editor TECO (Text Editor and COrrector) rodando sob o sistema ITS em um DEC PDP-10. O projeto foi iniciado por Guy Steele, para unir vários e divergentes conjuntos de comandos e atalhos para o TECO, e finalizado por Richard Stallman.

Para saber mais:

XEmacs home - [www.xemacs.org](http://www.xemacs.org/)
GNU Emacs home - [www.gnu.org/software/emacs/](http://www.gnu.org/software/emacs/)