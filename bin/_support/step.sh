#!/usr/bin/env bash

source "bin/_support/colors.sh"

step() {
  description=$1
  command=$2

  echo -n -e "${CYAN}${description}${WHITE}... ${NC}"

  eval "${command}"

  if [ $? -eq 0 ]
  then
    echo -e "${GREEN}OK${NC}"
  else
    echo -e "${RED}FAILED${NC}"
    exit
  fi
}

section() {
  title=$1
  echo -e "\n${YELLOW}${title}${NC}"
}
