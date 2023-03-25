# Bloco para definir uma variável, ou seja, um valor. Valor estático que posso referenciar algo. Nesse caso a variável é de qual região da AWS iremos utilizar.  

variable "region" {
  #  variable "name-of-variable"
  #  type = type of variable (string, map, list, number)
  #  default = value default of variable

  type    = string
  default = "us-east-2"
}

