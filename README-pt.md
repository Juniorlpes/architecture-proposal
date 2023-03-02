# Proposta de Arquitetura

É um projeto básico e contínuo [flutter](https://flutter.dev) para salvar e apresentar minha proposta de arquitetura limpa.

## Visão geral

Bom, essa proposta foi baseada na [Proposta do Reso Coder](https://resocoder.com/flutter-clean-architecture-tdd/) e na [Proposta do Flutterando](https://github.com/Flutterando/Clean-Dart) . Fiz algumas alterações/melhorias em ambas as propostas considerando algumas necessidades, e claro, respeitando os princípios SOLID e o Clean Code.

Este projeto tem duas ramificações. <br />
A ramificação <strong>base-proposal</strong> é a proposta limpa, é usado apenas código Dart/Flutter sem nenhum pacote externo, exceto o pacote [dartz](https://pub.dev/packages/dartz) que fornecem apenas aulas de dardo úteis. (consulte a classe [Ou](https://pub.dev/documentation/dartz/latest/dartz/Either-class.html))

A ramificação <strong>real-world</strong> é uma "ramificação do mundo real" onde utilizo alguns pacotes externos para dar suporte ao nosso trabalho diário de desenvolvimento, destacando o [flutter_modular](https://pub.dev/packages/flutter_modular) pacote que gerencia as rotas e ligações do app, separando as funcionalidades em módulos como o framework Angular (Javascript).

## Explicar

Aqui está a proposta de arquitetura limpa do tio Bob

![informações da imagem](./readme_assets/CleanArchitecture.png)

Observe que as divisões e as setas representam o fluxo da dependência.

Sigo o [Reso Coder](https://resocoder.com/) dividindo os recursos em três camadas conforme o diagrama:

![informações da imagem](./readme_assets/Clean-Architecture-Flutter-Diagram.png)

Todas as características da minha proposta seguem as divisões do diagrama.

Em minha proposta tentei simplificar uma grande quantidade de pastas e arquivos para evitar redundância, mas sem querer os princípios, mantendo alta coesão e baixo acoplamento.

Falando em baixo acoplamento, a classe RestService é a abstração de um pacote para requisições http, ela conhece o pacote externo e todas as fontes de dados dependem dele, então se o pacote para requisições for substituído, apenas esta classe terá que ser alterada.

## Pastas

Agora vou explicar a organização das pastas.

Na raiz do projeto (pasta lib) coloquei três pastas, features, core e shared.

A pasta <strong>core</strong> é para colocar classes "imutáveis". Classes que você não usará com frequência em seu trabalho de desenvolvimento. </br>
Ex: configuração do ambiente, abstração de serviços globais etc.

A pasta <strong>shared</strong> é para colocar arquivos compartilhados para todo o projeto.</br>
Ex: enums, entidades, extensões, constantes etc.

A pasta <strong>features/modules</strong> serve para colocar todas as features do projeto.</br>
Cada módulo será dividido em outras três pastas referentes às três camadas mostradas acima na imagem.

As três camadas são: <strong>domain</strong>, <strong>data</strong> e <strong>presenter</strong>.

O <strong>domain</strong> contém todas as regras de negócios. Diz <strong>o que</strong> o módulo faz.

A camada <strong>data</strong> informa <strong>como</strong> o módulo executa suas tarefas. </br>
Toda implementação, conexão é feita nesta camada.

<strong>Observe que:</strong> O repositório na imagem/diagrama pertence ao domínio e à camada de dados, portanto a abstração está no domínio, mas sua implementação é feita nos dados. </br>
Eu uso a implementação do repositório para lidar com possíveis erros de fonte de dados.

Por fim, a camada <strong>presenter</strong> cuida da exibição, dos widgets e da lógica da view. Ele conhece apenas os casos de uso do módulo.
