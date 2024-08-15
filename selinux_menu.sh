#!/data/data/com.termux/files/usr/bin/sh

# Códigos de cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Sem cor

# Função para verificar se o script está sendo executado como root
check_root() {
    if [ "$(id -u)" -ne "0" ]; then
        echo -e "${RED}Este script precisa ser executado como root.${NC}"
        exit 1
    fi
}

# Função para alterar o SELinux para permissivo
set_permissive() {
    echo -e "${CYAN}Alterando o SELinux para permissivo...${NC}"
    setenforce 0
    if [ "$(getenforce)" = "Permissive" ]; then
        echo -e "${GREEN}SELinux agora está no modo permissivo.${NC}"
    else
        echo -e "${RED}Falha ao alterar o modo SELinux.${NC}"
    fi
}

# Função para alterar o SELinux para enforcing
set_enforcing() {
    echo -e "${CYAN}Alterando o SELinux para enforcing...${NC}"
    setenforce 1
    if [ "$(getenforce)" = "Enforcing" ]; then
        echo -e "${GREEN}SELinux agora está no modo enforcing.${NC}"
    else
        echo -e "${RED}Falha ao alterar o modo SELinux.${NC}"
    fi
}

# Função para checar o status do SELinux
check_status() {
    echo -e "${CYAN}Status atual do SELinux: $(getenforce)${NC}"
}

# Menu principal
while true; do
    echo -e "${YELLOW}Escolha uma opção:${NC}"
    echo "1) Alterar para permissivo"
    echo "2) Alterar para enforcing"
    echo "3) Checar status"
    echo "4) Sair"
    read -p "Digite sua escolha [1-4]: " choice

    check_root

    case $choice in
        1)
            set_permissive
            ;;
        2)
            set_enforcing
            ;;
        3)
            check_status
            ;;
        4)
            echo -e "${CYAN}Saindo...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Opção inválida. Tente novamente.${NC}"
            ;;
    esac

    # Adiciona espaçamento entre ações
    echo
done