#!/usr/bin/env bash

# Configura proxy para tudo via CLI
export http_proxy=http://127.0.0.1:3128
export https_proxy=$http_proxy
export all_proxy=$http_proxy

echo "configurados proxys para tudo via cli:"
echo "- http_proxy  $http_proxy"
echo "- https_proxy $https_proxy"
echo "- all_proxy $all_proxy"
echo ""
echo ".ok"

echo ""
