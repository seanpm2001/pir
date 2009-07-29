#!parrot

.include 't/common.pir'
.sub "main" :main
    .local pmc tests

    load_bytecode 'pir.pbc'
    .include 'test_more.pir'

    tests = 'get_tests'()
    'test_parse'(tests)
.end

.sub "get_tests"
    .local pmc tests
    tests = new ['ResizablePMCArray']


    $P0 = 'make_test'( <<'CODE', 'macro pasring', 'todo' => 'Failing' )

.sub main
    .local int i
.end

.macro X(a, b)
    .a = .b
    .label $a:
.endm


.sub main
    .local int e,f
    .X(e,f)
.end

.macro X(a,b)
    .label $x: foo()

    .label $y:
    .a = .b

.endm

.sub main
    .X(a,b)
.end


CODE
    push tests, $P0

    $P0 = 'make_test'( <<'CODE', 'simple macro, no params', 'todo' => 'Failing' )

.macro myMacro
.endm

CODE
    push tests, $P0

    $P0 = 'make_test'( <<'CODE', 'simple macro, params', 'todo' => 'Failing' )

.macro doIt(A,B)
.endm

CODE
    push tests, $P0

    $P0 = 'make_test'( <<'CODE', '.macro_const' )

.macro_const answer 42

.macro_const name "Parrot"

.macro_const x P0
.macro_const y S1
.macro_const a I10
.macro_const b P20

CODE
    push tests, $P0


    $P0 = 'make_test'( <<'CODE', '.include' )

.include "Hello"

CODE
    push tests, $P0
    
    .return (tests)
.end


