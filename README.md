# Vindi Ruby

[![Build Status](https://semaphoreci.com/api/v1/projects/48986e75-f1a3-4ca3-ae41-2d6cf64ac507/1512354/badge.svg)](https://semaphoreci.com/vindi/vindi-ruby)

## Descrição

Ruby toolkit para a [API de Recorrência][link-introducao-api] da [Vindi][link-vindi].

## Requisitos

* Ruby >=2.3;
* Certificado digital HTTPS assinado por uma entidade certificadora;
* Conta ativa na [Vindi](https://www.vindi.com.br).

## Instalação

```ruby
gem 'vindi'
```

Então execute:

    $ bundle

Ou instale você mesmo:

    $ gem install vindi

## Uso
Os métodos da API estão disponíveis atraves dos métodos da instancia de um cliente

```ruby
  client = Vindi::Client.new(key: '<sua_vindi_api_key>')
```

Para testar no ambiente Sandbox, use o endpoint da API para efetuar requisições:

```ruby
  client = Vindi::Client.new(key: '<sua_vindi_api_key>', api_endpoint: 'https://sandbox-app.vindi.com.br/api/v1')
```

Caso prefira utilizar variáveis de ambiente para prover credenciais de acesso:

```
export VINDI_KEY="<sua_vindi_api_key>"
export VINDI_API_ENDPOINT="https://sandbox-app.vindi.com.br/api/v1"
```

### Consumindo recursos
Os recursos são fornecidos através do objeto de retorno e os campos retornados podem ser acessados pela notação de attributos de um Hash

```ruby
  # Listando planos de um lojista
  client.list_plans
  # => [{:id=>15, :name=>"My awesome plan", :interval=>"months", :interval_count=>1, :billing_trigger_type=>"beginning_of_period" ...

  # Consultando um plano
  client.plan(15)
  # => {:id=>15, :name=>"My awesome plan", :interval=>"months", :interval_count=>1, :billing_trigger_type=>"beginning_of_period" ...

  # Atualizando um plano
  client.update_plan(15, {name: 'My plan'})
  # => {:id=>15, :name=>"My plan", :interval=>"months", :interval_count=>1, :billing_trigger_type=>"beginning_of_period" ...

  # Criando um plano
  client.create_plan({name: 'My new plan', interval: 'months', interval_count: 1,  billing_trigger_type: 'beginning_of_period'})
```

### Acessando respostas HTTP

```ruby
  client.list_plans
  response  = client.last_response
  status = response.status
```

## Dúvidas
Caso necessite de informações sobre a plataforma ou API, por favor acesse o [Atendimento Vindi](http://atendimento.vindi.com.br/hc/pt-br).

## Segurança
Se você descobrir qualquer questão relacionada a segurança, por favor, envie um e-mail para seguranca@vindi.com.br ao invés de utilizar os issues.

## Changelog
Todas as informações sobre cada release podem ser consultadas em [CHANGELOG.md](CHANGELOG.md).

## Créditos
- [Vindi][link-author]
- [Todos os Contribuidores][link-contributors]

## Licença
GNU GPLv3. Por favor, veja o [Arquivo de Licença](license.txt) para mais informações.

[link-vindi]: https://www.vindi.com.br
[link-introducao-api]: http://atendimento.vindi.com.br/hc/pt-br/articles/203020644-Introdu%C3%A7%C3%A3o-%C3%A0-API-de-Recorr%C3%AAncia
[link-author]: https://github.com/vindi
[link-contributors]: https://github.com/vindi/vindi-ruby/graphs/contributors
