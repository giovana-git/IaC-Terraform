# Bloco para definir valores de saida. Utilizados para conversão e export de valores entre módulos, gerar um valor de saída como o endereço IP de uma instância

output "vpc_id" {
  #  nome do output entre aspas
  #  value = valor do output nesse caso, como estamos no módulo root (pai):
  # definimos um output no módulo VPC
  # output chamado vpc_id
  # para trazermos esse valor para referencia-lo em outros módulos devemos criar esse arquivo output
  # apontando para o caminho do output que é module.<nome-do-modulo>.<nome-do-output>

  value = module.networking.vpc_id
}