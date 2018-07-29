#!/bin/bash
# docker entrypoint for netscaler exporter

ARGS=()
ENV_ALL=(URL USERNAME PASSWORD BIND_PORT)

for ENV in "${ENV_ALL[@]}"; do
  echo "$ENV"
  if [ ! -z ${!ENV} ]; then
    ARG_NAME=$(echo "${ENV}" | tr '[:upper:]' '[:lower:]')
    ARGS+=("-${ARG_NAME}=${!ENV}")
  fi
done

# special treatment for ignore-cert
if [ ! -z ${IGNORE_CERT} ]; then
  ARGS+=("-ignore-cert")
fi

ARGS_STR=""

for ARG in "${ARGS[@]}"; do
  echo $ARG
  ARGS_STR="${ARGS_STR} ${ARG}"
done

/usr/local/bin/netscaler-exporter ${ARGS_STR}
