#!/usr/bin/env bash

# Variables
# --------------------------------------------------------------#

PRJ_NAME=qubescusto
SRC_VM=work
SRC_DIR=/home/user/Documents/test-dev/qubesos-formula
DST_DIR=/srv/salt

# Script
# --------------------------------------------------------------#

# Clean up local files
rm -f "${DST_DIR}/${PRJ_NAME}.top"
rm -fr "${DST_DIR}/${PRJ_NAME}"

# Retrieve remote files
qvm-run --pass-io ${SRC_VM} "cat ${SRC_DIR}/${PRJ_NAME}.top" > "${DST_DIR}/${PRJ_NAME}.top"
qvm-run --pass-io ${SRC_VM} "tar czf - -C ${SRC_DIR} ${PRJ_NAME}" > ${DST_DIR}/${PRJ_NAME}.tgz
tar xzf ${DST_DIR}/${PRJ_NAME}.tgz -C ${DST_DIR} && rm ${DST_DIR}/${PRJ_NAME}.tgz