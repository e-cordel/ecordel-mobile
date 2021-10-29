# e-cordel app

App para leitura de cordéis digitais.

## Iniciando o projeto no seu ambiente de desenvolvimento

    Esse readme assume que você possui todas as configurações necessárias para executar um projeto flutter.

Para configurar o seu ambiente e conseguir rodar o projeto localmente, siga a [documentação oficial](https://flutter.dev/docs/get-started/install).

### Iniciando o projeto 

Com um device conectado, execute o comando abaixo:

    flutter run

### Sobrescrevendo configurações

Você pode usar compile time variables para sobrescrever as configurações definidas no arquivo [env_config.dart](lib/configs/env_config.dart).

    flutter run --dart-define=API_URL=http://192.168.1.2:8080/api/v1

### Antes do push

```shell
    flutter format .
    flutter analyze
```

## Como contribuir

Para ajuda e informações de como contribuir com o projeto, acesse a [página oficial do e-codel](http://www.ecordel.com.br/como-contribuir).
