#!/usr/bin/env sh

source "bin/_support/colors.sh"

check() {
  description=$1
  command=$2
  remedy=$3

  echo -n -e "${CYAN}[checking] ${description}${WHITE}... ${NC}"

  eval "${command} > .doctor.out 2>&1"

  if [ $? -eq 0 ]
  then
    echo -e "${GREEN}OK${NC}"
    return 0
  else
    echo -e "${RED}FAILED${NC}"
    cat .doctor.out
    echo
    echo -e "${CYAN}Possible remedy: ${YELLOW}${remedy}${NC}"
    echo -e "${CYAN}(it's in the clipboard)${NC}"
    echo ${remedy} | pbcopy
    exit 1
  fi
}
