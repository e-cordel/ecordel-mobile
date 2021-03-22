# ecordel-mobile
Aplicativo Mobile para o projeto E-Cordel
=======
# ecordel mobile

Este projeto foi criado para prover uma versão mobile do projeto e-cordel, permitindo que o usuário consiga acessar e ler os cordeis de qualquer lugar.

## Iniciando o projeto no seu ambiente de desenvolvimento
Este projeto é feito em flutter. 
Para configurar o seu ambiente e conseguir rodar o projeto localmente, basta seguir os 5 passos descritos na seção 'Get started' da documentação oficial, [disponível aqui](https://flutter.dev/docs/get-started/install)

Depois disso, faça o clone do projeto para o seu computador e execute a partir do da sua IDE favorita.


## Organização inicial do projeto
A fim de melhor organizar o código e agilizar o desenvolvimento do aplitativo, o pacote [flutter_modular](https://pub.dev/packages/flutter_modular) da flutterando está sendo utilizado. Agora o projeto mobile vai utilizar o MobX como gestor de estados em vez do provider.

A organização dos diretórios segue, mas não se limita, a seguinte lógica: 
 - app -> contém todo o APP.
 - modules -> os módulos do projeto. Pensou-se em separar cada tela em um módulo. Um módulo contém uma estrutura completa para funcionar, como: controllers, pages e eventualmente, models, componentes, etc.
 - share -> tudo o que for disponível globalmente na aplicação, como configurações, modelos, repositórios e stores.
 
 ## Acesso a API
 
O acesso a API para realizar testes é feita através do repositório disponível em share -> ecordel_repository.dart. A URL da API está disponível em share -> configs -> api_configs.dart



## Melhorias
- Utilização do flutter_modular da flutterando
- Uso do MobX para gestão de estados
- Reestruturação da árvore de diretórios para melhor organização do código
- Aplicação das práticas de clean code
- Melhoria no tratamento de erros durante o fetch de dados.

Esta é uma estrutura inicial do projeto que requer muitas modificações. Sinta-se a vontade em nos ajudar.


