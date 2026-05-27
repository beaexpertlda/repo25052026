#!/bin/bash

# Nome do ficheiro YAML por defeito
YAML_FILE="hosts.yml"

# Função para exibir a ajuda/utilização do script
exibir_ajuda() {
    echo "Uso: $0 [opção] [parâmetros]"
    echo ""
    echo "Opções disponíveis:"
    echo "  -a, --adicionar    Adiciona um novo host. Requer: <nome_host> <ip_host> [grupo]"
    echo "  -l, --ler          Lê e lista todos os hosts registados."
    echo "  -b, --buscar       Procura um host específico pelo nome. Requer: <nome_host>"
    echo "  -h, --ajuda        Exibe esta mensagem de ajuda."
    echo ""
    echo "Exemplos:"
    echo "  $0 -a servidor1 192.168.1.10 webservers"
    echo "  $0 -l"
    echo "  $0 -b servidor1"
}

