[![Build](https://github.com/e-cordel/ecordel-mobile/actions/workflows/build.yml/badge.svg)](https://github.com/e-cordel/ecordel-mobile/actions/workflows/build.yml)

# E-cordel app

App para leitura de cordéis digitais.

## Iniciando o projeto no seu ambiente de desenvolvimento

    Esse readme assume que você possui todas as configurações necessárias para executar um projeto flutter.

Para configurar o seu ambiente e conseguir rodar o projeto localmente, siga a [documentação oficial](https://flutter.dev/docs/get-started/install).

### Iniciando o projeto 

Listando emulators

    flutter emulators

Iniciando emulador

    flutter emulators --launch <emulator-name>

Com um device conectado, execute o comando abaixo:

    flutter run

### Sobrescrevendo configurações

Você pode usar compile time variables para sobrescrever as configurações definidas no arquivo [env_config.dart](lib/configs/env_config.dart).

    flutter run --dart-define=API_URL=http://192.168.1.2:5000/api/v1

### Build apk em modo debug

    flutter build apk --debug

### Antes do push

```shell
    dart format .
    flutter analyze .
```
## Docs

[Documentação](./docs/).

## Como contribuir

Para ajuda e informações de como contribuir com o projeto, acesse a [página oficial do e-codel](http://www.ecordel.com.br/como-contribuir).

## Canais de Comunicação

Nos encontre nas seguintes plataformas abaixo:

<a href="https://ecordel.com.br/"><img align="center" alt="Site E-cordel" height="27" width="90" src="https://img.shields.io/badge/website-000000?style=for-the-badge&logo=About.me&logoColor=white"></a>

<a href="https://www.linkedin.com/company/e-cordel/"> <img align="center" alt="Linkedin" height="27" width="90" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white"> </a>

<a href="https://www.instagram.com/projetoecordel/"><img align="center" alt="Instagram" height="27" width="90" src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"></a>