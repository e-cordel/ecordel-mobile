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

A organização dos diretórios segue, mas não se limita, a seguinte lógica: 
 - app -> contém todo o APP.
 - commons -> tudo o que for disponível globalmente na aplicação.
 - screens -> cada tela criada será um novo subiretório de screens. componentes referentes a cada tela deve ficar dentro do seu respectivo diretório. Ex.: ecordel_card_widget.dart é utilizado apenas na home e na área de busca. Então esta deve residir dentro do diretório 'home'.
 
 ## Acesso a API
O acesso a API para realizar testes é feita através do commons -> providers -> cordel_provider.dart. A URL da API está disponível em commons -> api_configs.dart


## Melhorias
Esta é uma estrutura inicial do projeto que requer muitas modificações. Sinta-se  a vontade em nos ajudar.


