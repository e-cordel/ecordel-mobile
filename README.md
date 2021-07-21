# e-cordel app

App para leitura de cordéis digitais.

## Iniciando o projeto no seu ambiente de desenvolvimento

Este projeto é feito em flutter, esse readme assume que você já possui todas as configurações necessárias para executar um projeto flutter.

Para configurar o seu ambiente e conseguir rodar o projeto localmente, recomendamos seguir a [documentação oficial](https://flutter.dev/docs/get-started/install).

### Iniciando o projeto 

Com um device conectado, execute o comando abaixo:

    flutter run

### Sobrescrevendo configurações

Você pode usar compile time variables para sobrescrever as configurações definidas no arquivo [env_config.dart](lib/app/share/configs/env_config.dart).

    flutter run --dart-define=API_URL=http://192.168.1.2:8080/api/v1

## Organização inicial do projeto

A fim de melhor organizar o código e agilizar o desenvolvimento do aplitativo, o pacote [flutter_modular](https://pub.dev/packages/flutter_modular) da flutterando está sendo utilizado. O projeto utiliza MobX como gestor de estados em vez do provider.

A organização dos diretórios segue, mas não se limita, a seguinte lógica: 
 - app -> contém todo o APP.
 - modules -> os módulos do projeto. Pensou-se em separar cada tela em um módulo. Um módulo contém uma estrutura completa para funcionar, como: controllers, pages e eventualmente, models, componentes, etc.
 - share -> tudo o que for disponível globalmente na aplicação, como configurações, modelos, repositórios e stores.

## Como contribuir

Para ajuda e informações de como contribuir com o projeto, acesse a [página oficial do e-codel](http://www.ecordel.com.br/como-contribuir).
