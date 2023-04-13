#!/bin/sh
# build database
codeql database create demo --language=cpp --source-root=src --command="make" --overwrite
# codeql pack init docfate111/testing
# add to qlpack.yml the following 
# `dependencies:
#       codeql/cpp-all: "*"`
# codeql pack install 
 codeql query run live.ql -d=demo
