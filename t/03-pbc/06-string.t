#! /usr/bin/env parrot-nqp

pir::load_bytecode('t/common.pbc');
run_pbc_tests_from_datafile('t/pbc/string.txt');

# vim: ft=perl6
