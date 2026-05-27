#!/bin/bash

# Nome do ficheiro YAML por defeito
YAML_FILE="hosts.yml"

# ==========================================
# FUNÇÃO DE TRAP e GESTÃO DE SINAIS
# ==========================================
capturar_sinais() {
    echo -e "\n\n[AVISO] Operação cancelada pelo utilizador ou interrompida pelo sistema."
    echo "A fechar o script de forma segura..."
    # Se fossem usados ficheiros temporários, seriam removidos aqui:
    # rm -f /tmp/dados_temporarios.$$
    exit 1
}
# Ativar o trap para capturar:
# SIGINT (Ctrl+C), SIGTERM (Sinal de terminação), SIGTSTP (Ctrl+Z)
trap capturar_sinais SIGINT SIGTERM SIGTSTP

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


# ==========================================
# FLUXO PRINCIPAL (EXECUÇÃO)
# ==========================================

# Validação do número de argumentos mínimos
if [ $# -eq 0 ]; then
    exibir_ajuda
    exit 0
fi

# Tratamento dos parâmetros com base no primeiro argumento
case "$1" in
    -a|--adicionar)
        adicionar_host "$2" "$3" "$4"
        ;;
    -l|--ler)
        ler_hosts
        ;;
    -b|--buscar)
        buscar_host "$2"
        ;;
    -h|--ajuda)
        exibir_ajuda
        ;;
    *)
        echo "Opção inválida: $1"
        exibir_ajuda
        exit 1
        ;;
esac
