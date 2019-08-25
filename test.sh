#!/bin/bash
set -e

modules="string entry list hash string_entry list_string_entry fhtable"

function test_module() {
	cc -g $1/$1_test.c -o /tmp/kdb_test &&\
		valgrind --leak-check=full --error-exitcode=1 /tmp/kdb_test
}

if [ $# -gt 0 ]; then
	modules=$@
fi

for i in $modules
do
	printf '=%.0s' {1..80}
	echo
	echo ${i^^}
	printf '=%.0s' {1..80}
	echo

	test_module $i
done
